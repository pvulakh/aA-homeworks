class Stack

  def initialize
    @elements = []
    @last = nil
  end

  def push(el)
    @elements << el
    @last = el
  end

  def pop
    @elements.pop
    @last = elements.last
  end

  def peek
    @last
  end
end

