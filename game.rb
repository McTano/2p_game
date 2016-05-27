require_relative 'player'
require_relative 'says'
require 'colorize'
require 'byebug'

class Game

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @round = 0
    @p1.right_answers = 0
    @p1.wrong_answers = 0
    @p1.lives = 3
    @p2.lives = 3
  end

  FUNCTIONS = {:+ => "plus", :- => "minus", :* => "times"}
  NUMBERS = (1..20).to_a

  def ask_question(player)
    n1 = NUMBERS.sample
    n2 = NUMBERS.sample
    function = FUNCTIONS.keys.sample
    answer = n1.send(function, n2)

    puts "\t#{player.name}'s turn!"
    says "\tAnswer this, #{player.name}, if you're so smart..."
    says "\twhat's #{n1} #{FUNCTIONS[function]} #{n2}?\n"

    guess = prompt
    exit if guess == "exit" or guess == "quit"
    puts "\tYou said              :  #{guess}".colorize(answer == guess.to_i ? :green : :red)
    puts "\tThe correct answer was:  #{answer}".colorize(:green)

    if answer == guess.to_i
      player.gain_a_point
    else
      player.lose_a_life
    end

    player.check_in
  end


  def print_scores
    says "\n\tAt the end of round #{@round}, #{@p1.name} has #{@p1.lives} lives left,
        and #{@p2.name} has #{@p2.lives} lives left."
  end

  def play_round
    @round += 1
    puts "\n Round #{@round}\n"
    ask_question(@p1)
    puts ""
    ask_question(@p2)
    print_scores
  end


  def play
      loop do 
        play_round
        if @p1.lives == 0 || @p2.lives == 0
          end_game
          break
        end
      end
  end

  def end_game
    puts ""
    if @p1.lives !=0
      puts "\t#{@p1.name} wins after #{@round} rounds!".colorize(:green)
      @p1.wins += 1
    elsif @p2.lives !=0
      puts "\t#{@p2.name} wins after #{@round} rounds!".colorize(:green)
      @p2.wins += 1
    else
      puts "\tGame over after #{@round} rounds. Nobody wins.".colorize(:red)
      puts ""
    end
  end

end