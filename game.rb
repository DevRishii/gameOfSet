require "./card.rb"
require "./deck.rb"
require "./player.rb"

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

    #Starts timer of 10 seconds per player's turn @Henry
    def timerStart(seconds)
        timerEnd = Time.now + seconds
        while Time.now < timerEnd
            time = Time.at(timerEnd.to_i - Time.now.to_i)
            puts time.strftime('%S seconds to end your turn!')
            sleep 1
        end
    end


    #Asks user for total number of players; returns an int with number of players
    def getPlayers 
        puts "How many players are there: "
        playerCount = gets.chomp
        playerCount.to_i
    end
    
    # [1,2,79,80,81,6,7,8,9,10,11,12,13,14,15,..,3,4,5] <- used cards are no longer sent to back of deck array -Hunter
    # dealtcard = 12
    # endofarray = 78

end
    

    