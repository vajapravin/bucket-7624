module Helper
	attr_accessor :height, :width, :count, :operator, :operation

  private

  # Generate Prime Number
  def operation_p
    @arr = (1..count).select { |x| (1..x).select{ |y| x%y == 0 }.size == 2 }
  end

  # Generate Fibonacci Number
  def operation_f
    (1..count).map { |i| @arr << fibonacci(i) }
  end

  def fibonacci(n)
    return  n  if ( 0..1 ).include? n
    ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
  end

  # Output Matrix (Column)
  def display_column
    (0..@height-1).map { |i| display_row { |j| print "#{@arr[i].public_send(@operator, @arr[j])} " } }
  end

  # Output Matrix (Row)
  def display_row
    (0..@width-1).map { |j| yield(j) }
    puts
  end
end