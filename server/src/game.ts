import { randomUUID } from "crypto"
import { off } from "process"
import WebSocket from "ws"
import { Card } from "./card"

import { Player } from "./player"

export class Game {
    public createdAt = new Date()
    public readonly id = randomUUID()
    public started: boolean = false
    public readonly name


    public creator : Player
    public gamers : Player[] = []

    public stack : Card[] = []

    constructor(name: string,creator : {
        name : string,
        ws: WebSocket
    }){
        this.name = name
        this.creator = new Player(creator.name,creator.ws)

        this.generateStack()
    }

    private generateStack(){
        const colors = ['B','Y','G','R']

        // 19 simple cards
        for (const color of colors) {
            // 1 zero
            
            this.stack.push(new Card(`${color}0` as Card['type']))

            // A 3 of each
            for (let i = 0; i < 2; i++) {
                for (let j = 1; j <= 9; j++) {
                    this.stack.push(new Card(`${color}${j}` as Card['type']))
                }            
            }
        
            // +2 and revert and PASS
                for (let l = 0; l < 2; l++) {
                    // +2
                    const card = new Card(`${color}+2` as Card['type'])
                    this.stack.push(card)
    
                    // revert
                    const revertCard = new Card(`${color}R` as Card['type'])
                    this.stack.push(revertCard)

                    const passCard = new Card(`${color}P` as Card['type'])
                    this.stack.push(passCard)
                }
        }

        for (let m = 0; m < 4; m++) {
            this.stack.push(new Card('A'))   
            this.stack.push(new Card('A+4'))        
         }

        return this.stack
    }

    public shuffle(){
        for (let i = this.stack.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            const temp = this.stack[i];
            this.stack[i] = this.stack[j];
            this.stack[j] = temp;
          }
    }

    public getNumberOfGamers(){
        return this.gamers.length + 1
    }

    public getCards(numberOfCards : number,player : Player){
        let cards : Card[] = []
        for (let i = 0; i < numberOfCards; i++) {
            const card = this.stack.pop()
            if(!card){
                console.log('1')
                return []
            }
            cards.push(card)         
        }

        console.log('player.id',player.id)
        console.log('creator.id',this.creator.id)

        // The player is the creator
        if(player.id === this.creator.id){
            this.creator.giveCards(cards)
        }else{
            // Find player
            const index = this.gamers.findIndex((g)=>{
                return g.id === player.id
            })

            if(index < 0){
                return []
            }

            this.gamers[index].giveCards(cards)
        }

        return cards
    }
}
