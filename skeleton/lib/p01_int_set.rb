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
    current_array = @store[num % @store.length]
    if current_array.include?(num)
      current_array.delete(num)
    end
  end

  def include?(num)
    current_array = @store[num % @store.length]
    current_array.each do |el|
      if el == num 
        return true 
      end
    end
    false
    # return true if @store[num].include?(num)
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
  # attr_reader :count

  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store[num % @store.length].include?(num)
      @store[num % @store.length] << num
      self.count += 1
    end
    if self.count > num_buckets
      resize!
    end
  end

   def remove(num)
    current_array = @store[num % @store.length]
    if current_array.include?(num)
      current_array.delete(num)
      self.count -= 1
    end
  end

 def include?(num)
    current_array = @store[num % @store.length]
    current_array.each do |el|
      if el == num 
        return true 
      end
    end
    false
    # return true if @store[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
   input_arr = self.store.flatten
   array_test = Array.new(num_buckets*2) { Array.new }
   self.store = array_test
   self.count = 0
   input_arr.each {|num| self.insert(num) }
  end
end
