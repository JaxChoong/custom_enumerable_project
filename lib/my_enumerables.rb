module Enumerable
  # Your code goes here
  def my_all?
    for element in self
      return false unless yield(element)
    end
    true
  end
  def my_any?
    for element in self
      return true if yield(element)
    end
    false
  end
  def my_count
    count = 0
    if block_given?
      for element in self
        count += 1 if yield(element)
      end
    else
      for element in self
        count += 1
      end
    end
    count
  end
  def my_each_with_index
    if block_given?
      (0...self.length).each do |i|
        yield(self[i], i)
      end
    end
    return self
  end
  def my_inject(num)
    accumulator = num
    self.each do |element|
      accumulator = yield(accumulator, element)
    end
    return accumulator
  end
  def my_map
    new_array = []
    self.each do |value|
      new_array << yield(value)
    end
    return new_array
  end
  def my_none?
    for element in self
      return false if yield(element)
    end
    true
  end
  def my_select
    new_array = []
    self.each do |element|
      if yield(element)
        new_array << element 
      end
    end
    new_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each 
    for element in self
      yield(element)
    end
    self
  end
end
