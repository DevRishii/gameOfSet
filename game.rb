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

    #Starts timer @ETHAN
    def timerStart

    end


    #Asks user for total number of players; returns an int with number of players
    def getPlayers 
        playerCount = "-1"
        puts "How many HUMAN players are there: "

        while playerCount.to_i < 0 || playerCount.to_i.to_s != playerCount
            playerCount = gets.chomp

            if playerCount.to_i < 0 || playerCount.to_i.to_s != playerCount
                puts "Invalid number of players."
            end
        end
        playerCount.to_i
    end

    #Asks user for total number of bots
    def getBots(playerCount)

        botCount = "-1"
        comparison = 0
        #if there are no players, there must be at least 1 bot
        if playerCount == 0
            botCount = "0"
            comparison = 1
        end

        puts "How many BOTS are there: "

        while botCount.to_i < comparison || botCount.to_i.to_s != botCount
            botCount = gets.chomp

            if botCount.to_i < comparison || botCount.to_i.to_s != botCount
                puts "Invalid number of bots."
            end
        end
        botCount.to_i
    end
    
    #checks if there is a set currently on the table
    def verifyTable(tableDeck)

        a = 0
        b = 0
        c = 0
        for i in 0..tableDeck.length - 1 do
            for i in 0..tableDeck.length - 1 do
                for i in 0..tableDeck.length - 1 do
                    if a != b && a != c && b != c && tableDeck.verifyCards(tableDeck.index(a), tableDeck.index(b), tableDeck.index(c), "bot")

                        return true
                    end
                    c += 1
                end
                c = 0
                b += 1
            end
            b = 0
            a += 1
        end
        
        return false
    end

end
    

    