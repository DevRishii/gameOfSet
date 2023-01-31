require "./card.rb"
require "./deck.rb"
require "./players.rb"

#Class controlling the game state and logic (where everything will mainly occur)
class Game

    #Main function to initialize the game (calls other functions mainly)
    def initialize 

    end

    #Function that deals 3 cards
    #returns true if deals 3 cards and returns false if no cards left
    def dealCards(cardDeck, tableDeck)
        
        for i in 0..2 do

            if cardDeck.length > 0

                tableDeck.push(cardDeck.pop)  
            else     

                return false
            end
        end

        return true
    end

    #Checks if there is at least one set on the table 
    #returns true if there is at least one set
    #returns false if there are no sets
    def verifyTable 

    end

    #Asks user for total number of players and initializes the game based
    #on total number of players
    def getPlayers 
        
    end
    
    # [1,2,79,80,81,6,7,8,9,10,11,12,13,14,15,..,3,4,5] <- used cards are no longer sent to back of deck array -Hunter
    # dealtcard = 12
    # endofarray = 78

end
    

    