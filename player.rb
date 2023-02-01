require "./deck.rb"


#Class to control player related functions
class Player

    def initialize(name, score)
        @name = name
        @score = score
    end

    #Function to let the user choose what they want to do with their turn
    #
    # Asks player if they would like to choose a set or skip turn
    # If choose set, let the player choose 3 cards
    # calls verifyCards with the 3 chosen cards 
    # returns true of chosen cards are a set; returns false if they skip or cards are not a set
    def getChoice(tableDeck)
        
    end

    #returns name
    def name 
        @name
    end

    #returns score
    def score
        @score
    end

    #returns name and score of player
    def to_s
        "[#{@name},#{@score}]"
    end
end
