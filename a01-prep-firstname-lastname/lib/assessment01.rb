require 'byebug'

#[1,2,3].inject {|sum, el| sum += el}
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    i = 0
    while i < self.length
      prc.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num <= 1

  i = 2
  while i < num
    if (num % i) == 0
      return false
    end

    i += 1
  end

  return true
end

def primes(num)
  return [] if num == 0
  arr = []
  (1..100).each do |int|
    if is_prime?(int)
      arr << int
    end
  end
  arr[0...5]
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num <= 1
  (1..num).each do |int|

  end
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new([])
    self.each_with_index do |el, i|
      self.each_with_index do |el2, j|
        if i < j && el == el2
          hash[el] << i
        end
      end
    end
    hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    all_combos = []
    result = []
    i = 1
    while i <= self.length
      self.chars.each_cons(i) do |sub|
        if sub.join('') == sub.join('').reverse && sub.length >= 2
          result.push(sub.join(''))
        end
      end
      i += 1
    end

    result
  end

end



class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    dup_one = self
    return dup_one if dup_one.length <= 1
    left = dup_one[0...length/2]
    right = dup_one[length/2..-1]
    merge(merge_sort(left),merge_sort(right))
  end

  private
  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      if left.first < right.first
        result << left.shift
      else
        result << right.shift
      end
    end
    result + left + right
  end
end
