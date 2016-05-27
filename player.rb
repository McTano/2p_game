class Player
  def initialize(name)
    @name = name
    @lives = 3
    @right_answers = 0
    @wrong_answers = 0
    @wins = 0
  end

  attr_reader :name
  attr_accessor :lives
  attr_accessor :right_answers
  attr_accessor :wrong_answers
  attr_accessor :wins

  def gain_a_point
    @right_answers += 1
  end

  def lose_a_life
    @wrong_answers += 1
    @lives -= 1
  end

  def check_in
    puts "\tYou've gotten #{@right_answers} right and #{@wrong_answers} wrong."
    puts "\tYou have #{@lives} lives left\n"
  end


end