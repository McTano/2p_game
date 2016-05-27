require 'pry-byebug'

class Player
  def initialize(name)
    @name = name
    @lives = 3
  end

  def name
    @name
  end

  def lives
    @lives
  end
end

def ask_question(current_player)
  question = ""
  puts "Answer this, #{current_player.name}, if you're so smart..."
  puts question
end


puts "Player 1, Enter your name:"
print "> "

input = gets.chomp
p1 = Player.new(input)
puts "Hello there, #{p1.name}"

puts "Player 2, Enter your name:"
print "> "

input = gets.chomp
p2 = Player.new(input)
puts "Hello there, #{p2.name}"

# 2.times {p Random.rand(1..20)}
ask_question(p1)