module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    each do |elem|
      yield(elem, index)
      index += 1
    end
    self
  end

  def my_select
    selected = []
    each do |elem|
      selected << elem if yield(elem)
    end
    selected
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    each(&block)
  end
end
