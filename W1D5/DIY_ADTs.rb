class Stack
  attr_reader :ivar
  def initialize(ivar)
    @ivar = ivar
  end

  def push(el)
    ivar << el
  end

  def pop
    @ivar = @ivar[0..-2]
  end

  def peek
    @ivar[-1]
  end
end

stack = Stack.new([1,2,3,4,5])
stack.pop
p stack.peek
