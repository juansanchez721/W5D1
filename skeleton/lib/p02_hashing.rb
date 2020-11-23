class Integer
  # Integer#hash already implemented for you
end

# [2,2,3].hash # => 234242
# [2,1,3].hash => 234242
# [].hash => 233523523

class Array
  def hash
    middle = self.length/2
    self[middle].hash
  end
end

p [2,2,3].hash # => 234242
p [2,1,3].hash
class String
  def hash
    alpha = ("a".."z").to_a
    array = []
    self.each_char do |char|
      array << alpha.index(char) 
    end
  array.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
