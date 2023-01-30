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

    #function that checks if the 3 cards are a set
    #return true if all cards are a set
    def verifyCards (card1, card2, card3)
        
    end
end