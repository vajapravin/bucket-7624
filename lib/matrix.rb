require_relative 'helper'

class Matrix
  include Helper

  OPERATORS = { 'M' => '*', 'A' => '+' }.freeze
  BAD_CHOICE = 'Bad Choice'

  def initialize
    @arr = []
  end

  def input
    print "\nPlease give matrix dimension (<width>x<height>):"
    @width, @height = gets.downcase.chomp.split('x').map(&:to_i)
    @count = @height*@width
    print "\n(M)ultiplication (*) or (A)ddition (+)"
    @operator = OPERATORS[gets.upcase.chomp]
    print "\nShould I use (P)rime numbers or (F)ibonacci numbers?"
    @operation = gets.upcase.chomp
  end

  def process
    if %w(P F).include?(@operation)
      send("operation_#{@operation.downcase}".to_sym)
      if OPERATORS.values.include?(@operator)
        display_column 
        return
      end
    end
    puts BAD_CHOICE
  end
end