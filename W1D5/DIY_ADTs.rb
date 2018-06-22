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

# stack = Stack.new([1,2,3,4,5])
# stack.pop
# p stack.peek

class Queue
  attr_reader :ivar

  def initialize(ivar)
    @ivar = ivar
  end

  def enqueue(el)
    @ivar = [el].concat(@ivar)
  end

  def dequeue
    @ivar = @ivar[0..-2]
  end

  def peek
    @ivar[-1]
  end
end

que = Queue.new([1,2,3,4])
p que.ivar
que.enqueue(5)
p que.ivar
que.dequeue
p que.ivar
p que.peek
p que.ivar
