import { randomUUID } from "crypto"
import WebSocket from "ws"
import { Card } from "./card"

export class Player {
    public readonly id = randomUUID()
    public readonly name : string

    public hand : Card[] = []
    ws: WebSocket

    constructor(name: string,ws: WebSocket){
        this.name = name
        this.ws = ws
    }

    public giveCards(cards : Card[]){
        this.hand = this.hand.concat(cards)
        return this
    }
}