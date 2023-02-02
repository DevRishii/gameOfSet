require "./deck.rb"


#Class to control player related functions
class Player

    def initialize(name, score, type)
        @name = name
        @score = score
        @type = type
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

        if skip == false && tableDeck.verifyCards(tableDeck.index(chosenCard[0].to_i - 1), tableDeck.index(chosenCard[1].to_i - 1), tableDeck.index(chosenCard[2].to_i - 1), "player")

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

    #Bot will randomly choose a number 1-100,
    #if the number is 49 or below then the bot will scan the entire table
    #and pick the first set they see.
    #If no set is found, the bot will skip their turn.
    #If the number is 50 or higher then the bot will skip their turn.
    #
    #No matter what, before the bot skips or picks a set,
    #the bot will randomly choose a number 2-6,
    #and the bot will have that many seconds of artificial thinking time.
    #
    #botChoice returns true if a set was found, and returns false if not.
    def botChoice(tableDeck, name)

        thinkingTime(name)
        if rand(1..100) < 50 
            a = 0
            b = 0
            c = 0
            for i in 0..tableDeck.length - 1 do
                for i in 0..tableDeck.length - 1 do
                    for i in 0..tableDeck.length - 1 do
                        if a != b && a != c && b != c && tableDeck.verifyCards(tableDeck.index(a), tableDeck.index(b), tableDeck.index(c), "bot")

                            chosenCardInt = Array.new
                            chosenCardInt.push(a, b, c)

                            #delete selected cards from tableDeck from bottom to top
                            chosenCardInt.sort!
                            chosenCardInt.reverse_each do |i|
                                tableDeck.delete_at(i)         
                            end

                            puts ""
                            puts "#{name} has found a set: #{a + 1} #{b + 1} #{c + 1}"
                            sleep 1
                            puts "+1 point for #{name}."
                            sleep 1
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
        end

        puts ""
        puts "#{name} will skip their turn."
        sleep 1
        return false
    end

    def thinkingTime(name)
        puts ""
        print "#{name} is thinking"
        time = rand(2..6)

        for i in 0..time do
            sleep 1
            print "."
        end
    end

    #returns name
    def name 
        @name
    end

    #returns score
    def score
        @score
    end

    #returns type
    def type
        @type
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
