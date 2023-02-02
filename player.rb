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
        sizeDeck = tableDeck.length
        while !checkVal
            puts "Enter the 3 card numbers you would like to choose."
            puts "Card number starts from Zero(0) to #{sizeDeck} and split numbers with space."
            choice = gets.chomp
            chosenCard = Array.new
            chosenCard = choice.split
            chosenCard.each do |i|
                if i.to_i.to_s == i

                    i = i.to_i
                    if !(i >= 0) || !(i < sizeDeck)
                        puts "Typed wrong Number(s)"
                        break
                    end
                    checkVal = true
                else
                    puts "One or more character is not a Number"
                    break
                end
            end
            
        end
        return tableDeck.verifyCards(tableDeck.index(chosenCard[0].to_i), tableDeck.index(chosenCard[1].to_i), tableDeck.index(chosenCard[2].to_i))

    end

    #returns name
    def name 
        @name
    end

    #returns score
    def score
        @score
    end

    #adds x to score
    def addScore(x)
        @score += x
    end

    #returns name and score of player
    def to_s
        "[#{@name},#{@score}]"
    end
end
