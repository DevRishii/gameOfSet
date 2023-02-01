require "./card.rb"

#Class controlling a Deck of objects can be empty or full (basically an array, used for cards and players)
class Deck
    #Card Attributes
    Colors = ["red", "green", "blue"]
    Numbers = [1,2,3]
    Shapes = ["diamond", "oval", "squig"]
    Shading = ["empty", "shaded", "solid"]
 
    def initialize
        @deck = Array.new
    end

    #Function that initialized the array holding all 81 cards
    #uses nested for loops to create
    def createFullDeck
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

    #returns length of the array
    def length
        @deck.length
    end 

    #shuffles all the items in a array
    def shuffle
        @deck.shuffle!
    end

    #adds an item to the end of the array
    def push(x)
        @deck.push(x)
    end

    #removed the item at the end of the array
    def pop
        @deck.pop
    end

    def index(x)
        @deck[x]
    end

    #returns a string representation of the deck
    def to_s
        @deck.each do |item|
            item.to_s
        end
    end

    #function that checks if the 3 cards are a set
    #return true if all cards are a set
    #last edited 1.30 by Ethan
    def verifyCards card1, card2, card3
        isSet = true
        #compares each feature using a for loop
        for i in 0..3 do
            #each feature of 3 cards either be the same OR different
            if not (card1[i] == card2[i] && card2[i] == card3[i]) || 
                (card1[i] != card2[i] && card1[i] != card3[i] && card2[i] != card3[i])
                return false
            end
        end
        return isSet
    end

end