
class Interface
  
  def initialize
    @games = 0
  end

  def ask_names
    says "\n\tWelcome to Mathblasters!\n"

    puts "\tPlayer 1, Enter your name:"

    input = prompt
    @p1 = Player.new(input)
    says "\tHello there, #{@p1.name}."

    puts "\n\tPlayer 2, Enter your name:"
    print "> "
   
    input = prompt
    @p2 = Player.new(input)
    says "\tHello there, #{@p2.name}."

    puts "\n\tLet's begin.\n"
  end
 
  def play_game
    loop do
      @games += 1
      game = Game.new(@p1, @p2)
      game.play
      
      puts "\n#{@p1.name} has won #{@p1.wins} games and #{@p2.name} has won #{@p2.wins}"

      puts 'Want to play again? (y/n)'
        loop do
          play_again = prompt.downcase
          if play_again.start_with?('y')
            break
          elsif play_again.start_with?('n')
            exit
          end
        end
    end
  end

  def run
    ask_names
    play_game
  end

end