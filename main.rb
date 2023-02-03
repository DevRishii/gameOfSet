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
            playerDeck.push(Player.new("Player #{i}: "+ name, 0, "player"))
            i += 1
        end

        botCount = game.getBots(playerCount)
        playerCount += botCount
        i = 1
        #Creates a bot object for each bot and adds to an array holding all players
        while i <= botCount do
            puts "Enter bot #{i}'s name: "
            name = gets.chomp
            playerDeck.push(Player.new("Bot #{i}: "+ name, 0, "bot"))
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
        for i in 0..3 do

            game.dealCards(cardDeck, tableDeck)
        end

        #while loop that will be going forever until game ends
        while gameStatus 
            if playerTurn > playerCount
                playerTurn = 1
            end

            sleep 0.5

            puts ""
            puts "It is #{playerDeck.index(playerTurn - 1).name}'s turn!"
            puts "Current score: #{playerDeck.index(playerTurn - 1).score}"
            puts ""

            #Displays cards on the table for the player
            for i in 1..tableDeck.length do
                puts "#{i}: " + tableDeck.index(i - 1).to_s
            end
            
            # Checks first if player is human or bot.
            # Asks the current player what their choice is,
            # Adds a point to the player and totalpoints 
            # if the method returns true
            if (playerDeck.index(playerTurn - 1).type == "player" && playerDeck.index(playerTurn - 1).getChoice(tableDeck, cardDeck) == true) || (playerDeck.index(playerTurn - 1).type == "bot" && playerDeck.index(playerTurn - 1).botChoice(tableDeck, playerDeck.index(playerTurn - 1).name, cardDeck) == true)

                playerDeck.index(playerTurn - 1).addScore(1)
                totalPoints += 1
                game.dealCards(cardDeck, tableDeck) #Deal 3 new cards to the table
            end

            playerTurn += 1

            staleMate = false
            #check the table for sets when there are no more cards left to be drawn
            if cardDeck.length == 0 && game.verifyTable(tableDeck) == false
                sleep 1
                puts ""
                puts "There are no more possible sets."
                sleep 0.5
                staleMate = true
            end

            if totalPoints == 27 || staleMate == true
                puts "Game over"
                winner = Player.new(playerDeck.index(0).name, playerDeck.index(0).score, playerDeck.index(0).type)
                tieCount = 0
                for i in 1..(playerDeck.length - 1) do
                    if playerDeck.index(i).score > winner.score
                        winner.setScore(playerDeck.index(i).score)
                        winner.setName(playerDeck.index(i).name)
                    elsif playerDeck.index(i).score == winner.score
                        tieCount += 1
                    end
                end

                puts ""
                if tieCount != playerDeck.length - 1 || playerDeck.length == 1
                    puts "The winnner is #{winner.name} with a score of #{winner.score}!"
                else
                    puts "The game is a tie..."
                end
                puts ""
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
                    for i in 0..(playerDeck.length - 1) do
                        playerDeck.index(i).setScore(0)                    
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