type Red = 'R0' | 'R1'| 'R2' | 'R3' | 'R4' | 'R5' | 'R6' | 'R7' | 'R8' | 'R9' | 'RR' | 'RP' | 'R+2'
type Blue = 'B0' |'B1'| 'B2' | 'B3' | 'B4' | 'B5' | 'B6' | 'B7' | 'B8' | 'B9' | 'BR' | 'BP' | 'B+2'
type Yellow = 'Y0' | 'Y1'| 'Y2' | 'Y3' | 'Y4' | 'Y5' | 'Y6' | 'Y7' | 'Y8' | 'Y9' | 'YR' | 'YP' | 'Y+2' 
type Green = 'G0' | 'G1'| 'G2' | 'G3' | 'G4' | 'G5' | 'G6' | 'G7' | 'G8' | 'G9' | 'GR' | 'GP' | 'G+2'
type Other = 'A+4' | 'A'

export type CardType = Red |Blue | Yellow | Green | Other

export class Card {
  
    type : CardType | null = null

    constructor(type : CardType | null ){
        this.type = type
    }

    setType(newType : CardType){
        this.type = newType
        return this
    }

}