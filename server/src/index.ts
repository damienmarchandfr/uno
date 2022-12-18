import { WebSocket, WebSocketServer} from 'ws'
import express from 'express'
import cors from 'cors'
import _ from 'lodash'

import { Game } from './game'
import { writeFileSync } from 'fs'


const HTTP_PORT = 3000
const WS_PORT = 8080

const games : Game[] = [
   
]

// ----------------- HTTP -----------------

function wait(req: express.Request,res: express.Response, next : express.NextFunction){
    setTimeout(()=>{
        next()
    },2000  )
}

const app = express()
// app.use(wait)
app.use(cors({
    origin: '*'
}))
app.use(express.json())
app.use(express.urlencoded())


app.get('/ping',(req,res,next)=>{
    return res.status(200).json({})
})

app.get('/games',(req,res,next)=>{
    
    let sortedGames = _.orderBy(games,'createdAt','desc').filter((g)=>{
        return !g.started
    })

    return res.status(200).json(sortedGames.map(g=>{
        return {
            id: g.id,
            game_name : g.name,
            creator_name : g.creator.name,
            number_of_gamers : g.getNumberOfGamers()
        }
    }))
})


app.get('/games/:id',(req,res,next)=>{
    const game = games.find((g)=>{
        return g.id === req.params.id
    })

    if(!game){
        return res.status(404).json({error : `Unknown game : ${req.params.id}`})
    }

    return game
})

app.listen(HTTP_PORT,()=>{
    console.log('HTTP listen to '+HTTP_PORT)
})

// --------------- WS -----------------

// Creating a new websocket server
const wss = new WebSocketServer({ port: WS_PORT })

type Action = 'create_game' | 'start_game'

type CreateGameMessage = {
    action : Action,
    gamer_name : string,
    game_name: string
}

type StartGameMessage = {
    action : Action,
    game_id : string,
    creator_id : string
}


wss.on("connection", ws => {
    console.log("new client connected");

    ws.on("message", (data) => {
        const input = data as Buffer
        let message = ''
        if(input.toLocaleString().includes('\0')){
            message = input.toLocaleString().split("\0").shift() as string
        }
        
        const parsed = JSON.parse(message) as {action : Action}

        switch (parsed.action) {
            case 'create_game':
                const d = parsed as CreateGameMessage
                if(d.game_name.length && d.gamer_name.length){
                    const game = new Game(d.game_name,{
                        name: d.gamer_name,
                        ws
                    })
                    game.shuffle()
                    games.push(game)

                    const response = {
                        action : 'created_game', 
                        game_id : game.id,
                        game_name : game.name,
                        game_started : game.started,
                        gamer_id : game.creator.id,
                        gamer_name : game.creator.name
                    }

                    ws.send(JSON.stringify(response),(err)=>{
                        if(err){
                            console.error(err)
                        }
                    })
                }
                
                break;

            case 'start_game':
                const ds = parsed as StartGameMessage
                // Search game
                const game = games.find((g)=>{
                    return g.id === ds.game_id && g.creator.id === ds.creator_id
                })
                if(!game){
                    break
                }
                game.started = true

                // Send 7 cards to all players
                game.gamers.forEach((gamer)=>{
                    gamer.ws.send(JSON.stringify({
                        action : 'started_game',
                        hand : game.getCards(7,gamer),
                        game_id : game.id
                    }),(err)=>{
                        console.log(err)
                    })
                })
                // Send 7 cards to creator
                ws.send(JSON.stringify({
                    action: 'started_game',
                    hand : game.getCards(7,game.creator),
                    game_id : game.id
                }),err=>{
                    if(err){
                        console.error(err)
                    }
                })

                break

            default:
                break;
        }

        
    });

    ws.on("close", () => {
        console.log("the client has connected");
    });
    // handling client connection error
    ws.onerror = function (error) {
        console.error(error)
        console.log("Some Error occurred")
    }
});

console.log("The WebSocket server is running on port "+ WS_PORT);