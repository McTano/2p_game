def prompt
  loop do
    print '> '
    input = gets.chomp.strip
    unless input == ''
      return input
    end
  end
end