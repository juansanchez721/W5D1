class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if is_valid?(num)
    store[num] = true 
  end

  def remove(num)
    store[num] = false
    # @store.delete_at(num)  ASK
  end

  def include?(num)
    store[num]
  end

  attr_reader :store

  def is_valid?(num)
    num > @max || num < 0 
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new}
  end

  def insert(num)
    @store[num % @store.length] << num
    # p @store.[](num)
    
    # p ""
    # p num
    # @store.[](num) << num
  end

  def remove(num)
    @store[num] = [false]
  end

  def include?(num)
    p @store[num]
    return true if @store[num].include?(num)
  end

  private

  def [](num)
    mod = num % @store.length
    return @store[mod]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @store[num] = [true] if @store[num][0] == false
  end

  def remove(num)
  end

  def include?(num)
    @store[num][0]
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
