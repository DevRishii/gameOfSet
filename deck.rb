require "./card.rb"
require "./game.rb"

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

    #gets specified element of array by index
    def index(x)
        @deck[x]
    end

    #removes item from array at specific index
    def delete_at(x)
        @deck.delete_at(x)
    end

    #put tableDeck back into cardDeck, shuffle cardDeck, then put a max of 12 cards back into tableDeck.
    #Using dealCards method could be useful here
    def reshuffle(cardDeck, tableDeck, game)
        while tableDeck.length > 0
            cardDeck.push(tableDeck.pop)
        end
        
        cardDeck.shuffle

        4.times do 
            game.dealCards(cardDeck, tableDeck)
        end
    end

    #returns a string representation of the deck
    def to_s
        @deck.each do |item|
            item.to_s
        end
    end

    #function that checks if the 3 cards are a set
    #return true if all cards are a set
    #edited 1.30 by Ethan, last edited 2.1 by Hunter
    def verifyCards card1, card2, card3, playerType
        isSet = true

        #compares each feature using a for loop
        for i in 0..3 do
            #each feature of 3 cards either be the same OR different
            if not (card1.featureIndex(i) == card2.featureIndex(i) && card2.featureIndex(i) == card3.featureIndex(i)) ||
                (card1.featureIndex(i) != card2.featureIndex(i) && card1.featureIndex(i) != card3.featureIndex(i) && card2.featureIndex(i) != card3.featureIndex(i))

                if playerType == "player"
                    puts ""
                    puts "Not a set. No points earned."
                end
                return false
            end
        end

        if playerType == "player"
            puts ""
            puts "That is a set! +1 point."
        end
        return isSet
    end

end