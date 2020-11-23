class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    keyhash = key.hash
    if !@store[keyhash % @store.length].include?(key)
      @store[keyhash % @store.length] << key
      self.count += 1
    end
    if self.count > num_buckets
      resize!
    end
  end


  def include?(key)
    keyhash = key.hash
    current_array = @store[keyhash % @store.length]
    current_array.each do |el|
      if el == key 
        return true 
      end
    end
    false
  end

  def remove(key)
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
