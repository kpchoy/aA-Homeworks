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

# que = Queue.new([1,2,3,4])
# p que.ivar
# que.enqueue(5)
# p que.ivar
# que.dequeue
# p que.ivar
# p que.peek
# p que.ivar

class Map
  def initialize
    @arr = []
  end

  def set(k,v)
    pair_index = @arr.index { |pair| pair[0] == key}
    if pair_index
      @arr[pair_index][1] = value
    else
      @arr.push([k,v])
    end
    value
  end

  def get(key)
    @arr.each { |pair| return pair[1] if pair[0] == key}
    nil
  end

  def delete(key)
    value = get(key)
    @arr.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(@arr)
  end

  private

  attr_reader :arr
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
