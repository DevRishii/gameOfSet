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
        checkVal = false
        sizeDeck = tableDeck.length()
        while !checkVal
            puts "Enter the card number you would like to choose."
            puts "Card number starts from Zero(0) to #{sizeDeck} and split numbers with space."
            choice = gets.chomp
            chosenCard = Array.new
            chosenCard = choice.split
            chosenCard.each do |i|
                if i.is_an_int
                    if !(i >= 0) || !(i < sizeDeck)
                        puts "Typed wrong Number"
                        break
                    end
                    checkVal = true
                else
                    puts "Typed wrong Number"
                    break
                end
            end
            
        end
        return verifyCards(chosenCard[0], chosenCard[1], chosenCard[2])

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
