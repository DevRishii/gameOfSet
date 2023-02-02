require "./game.rb"
require "./card.rb"
require "./deck.rb"
require "./player.rb"

# deck = Deck.new

# puts deck.length
# puts deck.shuffle

class Main

    puts "Welcome to the game of Set"
    puts ""
    puts "Would you like to start a new game? (1 - yes, 2 - no)"

    gameChoice = gets.chomp.to_i

    if gameChoice == 1 
        game = Game.new
        playerCount = game.getPlayers

        playerDeck = Deck.new
        i = 1
        #Creates a player object for each player and adds to an array holding all players
        while i <= playerCount do
            puts "Enter player #{i}'s name: "
            name = gets.chomp
            playerDeck.push(Player.new("Player #{i}: "+ name, 0))
            i += 1
        end

        #Creates the original deck with 81 cards and randomizes the order of cards
        cardDeck = Deck.new
        cardDeck.createFullDeck
        cardDeck.shuffle

        tableDeck = Deck.new

        gameStatus = true

        totalPoints = 0

        playerTurn = 1

        #Starts the game with a total of 9 cards on the table
        for i in 0..2 do

            game.dealCards(cardDeck, tableDeck)
        end

        #while loop that will be going forever until game ends
        while gameStatus 
            if playerTurn > playerCount
                playerTurn = 1
            end

            puts ""
            
            for i in 1..tableDeck.length do
                puts "#{i}: " + tableDeck.index(i - 1).to_s
            end
            

            #Asks the current player what their choice is,
            # Adds a point to the player and totalpoints 
            # if the method returns true
            if playerDeck.index(playerTurn - 1).getChoice == true

                playerDeck.index(playerTurn - 1).addScore(1)
                totalPoints += 1
            end

            #calls all necessary functions inside of game 
            #gameStatus = false

            playerTurn += 1
            game.dealCards(cardDeck, tableDeck) #Deal 3 new cards to the table

            if totalPoints == 27
                puts "Game over"
                winner = Player.new("winner", 0)
                for i in playerDeck
                    if i.score > winner.score
                        winner.score = i.score
                        winner.name = i.name
                    end
                end
                puts ""
                puts "The winnner is #{winner.name} with a score of #{winner.score}"

                puts "Would you like to play again? (1 - yes, 2 - no)"
                gameChoice = gets.chomp.to_i
                if gameChoice == 1
                    gameStatus = true;

                    #everything below is to reset the game
                    playerTurn = 1
                    totalPoints = 0
                    cardDeck = Deck.new
                    cardDeck.createFullDeck
                    cardDeck.shuffle
                    tableDeck = Deck.new

                    #Starts the game with a total of 9 cards on the table
                    for i in 0..2 do
                        game.dealCards(cardDeck, tableDeck)
                    end

                    #Reset individual player scores
                    for i in playerDeck
                        i.score = 0                    
                    end

                else
                    gameStatus = false;
                end
            end
        end
        puts "Game Ending..."



    else #game will end
        puts "Game Ending..."
    end

end