require "./card.rb"


class Deck
    #Card Attributes
    Colors = ["red", "green", "blue"]
    Numbers = [1,2,3]
    Shapes = ["diamond", "oval", "squig"]
    Shading = ["empty", "shaded", "solid"]

    def initialize
        @deck = Array.new
        Numbers.each do |number|
            Shapes.each do |shape|
                Colors.each do |color| 
                    Shading.each do |shade|
                        @deck.push(Card.new(number, shape, color, shade))
                    end
                end
            end
        end
    end

    def length
        @deck.length
    end 

    def shuffle
        @deck.shuffle!
    end


    #Function that deals 3 cards
    #returns true if deals 3 cards and returns false if no cards left
    def dealCards(dealtcard, endofarray)
        
    end

    #Function that initialized the array holding all 81 cards
    #uses nested for loops to create, include a randomizer option
    def createDeck 

    end

    #function that checks if the 3 cards are a set
    #return true if all cards are a set
    def verifyCards (card1, card2, card3)
        
    end

    #Checks if there is at least one set on the table 
    #returns true if there is at least one set
    #returns false if there are no sets
    def verifyTable 

    end

    #Function to let the user choose what they want to do with their turn
    def getChoice 
        
    end

    #Asks user for total number of players and initialized the game based
    #on total number of players
    def getPlayers 

    end

    

    #Main function to initialize the game (calls other functions mainly)
    def initializeGame 

    end
    

    # [1,2,79,80,81,6,7,8,9,10,11,12,13,14,15,..,3,4,5]
    # dealtcard = 12
    # endofarray = 78

end