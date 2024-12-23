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

  def my_all?
    is_true = true
    each do |elem|
      is_true = yield(elem) ? true : false
      break unless is_true
    end
    is_true
  end

  def my_none?
    is_false = false
    each do |elem|
      is_false = yield(elem) ? false : true
      break unless is_false
    end
    is_false
  end

  def my_count
    return length unless block_given?

    count = 0
    each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_map
    new_arr = []
    each do |elem|
      new_arr << yield(elem)
    end
    new_arr
  end

  def my_inject(initial)
    result = initial
    each do |elem|
      result = yield(result, elem)
    end
    result
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
