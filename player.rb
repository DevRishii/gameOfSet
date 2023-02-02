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
        skip = false
        puts ""
        puts "Card range is from 1 to #{sizeDeck}."
        puts "Enter the 3 card numbers you would like to choose."
        puts "Split numbers with a space."
        puts "Or type \"s\" to skip..."
        while !checkVal
            choice = gets.chomp
            if choice != "s"
                checkVal = true
                chosenCard = Array.new
                chosenCard = choice.split

                if chosenCard.length == 3
                    chosenCard.each do |i|
                        if i.to_i.to_s == i

                            i = i.to_i
                            if !(i >= 0) || !(i <= sizeDeck)
                                puts "Typed wrong Number(s)."
                                checkVal = false
                                break
                            elsif chosenCard[0] == chosenCard[1] || chosenCard[0] == chosenCard[2] || chosenCard[1] == chosenCard[2]
                                puts "Can only enter each card once."
                                checkVal = false
                                break
                            end
                        else
                            puts "One or more character is not a Number."
                            checkVal = false
                            break
                        end
                    end
                else
                    puts "Exactly 3 cards must be entered."
                    checkVal = false  
                end
                
            else
                puts ""
                puts "Turn skipped."
                skip = true
                checkVal = true
            end
        end

        if skip == false && tableDeck.verifyCards(tableDeck.index(chosenCard[0].to_i - 1), tableDeck.index(chosenCard[1].to_i - 1), tableDeck.index(chosenCard[2].to_i - 1))

            #put chosen numbers into integer array (otherwise they will not sort)
            chosenCardInt = Array.new
            chosenCard.each do |i|
                chosenCardInt.push(i.to_i)
            end

            #delete selected cards from tableDeck from bottom to top
            chosenCardInt.sort!
            chosenCardInt.reverse_each do |i|
                tableDeck.delete_at(i - 1)         
            end

            return true
        end

        return false
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

    #sets the score to x
    def setScore(x)
        @score = x
    end

    #sets the name to x
    def setName(x)
        @name = x
    end

    #returns name and score of player
    def to_s
        "[#{@name},#{@score}]"
    end
end
