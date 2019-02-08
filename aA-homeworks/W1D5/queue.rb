class Queue

  def initialize
    @elements = []
    @first = nil
  end

  def enqueue(el)
    @elements << el
    @first = el if @first.nil?
  end

  def dequeue
    @elements.shift
    @first = elements.first
  end

  def peek
    @first
  end

  def inspect
    puts "#{@elements}, first: #{@first}"
  end
end