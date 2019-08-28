class Word
    # Referenced this for guess?(letter) and figuring out how to convert
    # the display to input letters: https://codereview.stackexchange.com/questions/189673/hangman-game-in-ruby
    
    # Stores the provided word in an instance variable and
    # setups up any other instance variables.
    def initialize(word)
      @word = word
      @display = @word.sub(@word, "_" * @word.length)
      # @lives = 4
    end
  
    # Guess a letter in the word.
    # Should return a boolean. true if the letter is in the word, false if not.
    def guess?(letter)
        if letter.length == 1 && letter =~ /[[:alpha:]]/
            @display.length.times do |i| 
                if @word[i] = letter
                    puts "Yes, the word does have that letter"
                    @display[i] = letter
                    return true
                else
                    puts "Sorry, but the word does not include that letter"
                    # @lives -= 1
                    return false
                end
            end
        else
            puts "Sorry, but that guess was not valid"
        end
    end
  
    # Whether all letters in the word have been guessed correctly.
    def guessed_all_correct?
        puts "Congraulations! You Win! And word is..."
        output_word
    end
  
    # Display the current state of the guessed word for the player.
    def output_word
        puts @display
    end
  
    # Check whether a provided character is a letter
    def self.is_letter?(character)
    end
  end
  
  class MysteryWordGame < Word
    # Initialize any state in the game, and start the game loop.
    def initialize(word)
      super(word)
      @lives = 5
    end
  
    def ask_for_word
      puts "What is the word? Please look away Player 2..."
      @word = gets.chomp()
    end
  
    # Run the game loop, which continues until the player wins or loses.
    def game_loop
      ask_for_word
      output_word
      while @lives > 0
        puts "You have #{@lives} remaining guesses"
        output_word
        print "Please enter a letter: "
        guess?(gets.chomp)
        @lives -= 1
      end
      guessed_all_correct?
    end
  end
  
  game = MysteryWordGame.new("word")
  puts game
  
  game.game_loop