def range(floor, ceiling)
  return [] if ceiling < floor
  [floor] + range(floor+1, ceiling)
end

def sum_recur(array)
  return 0 if array.empty?
  array.pop + sum_recur(array)
end

def sum_iterr(array)
  sum = 0
  array.each do |i|
    sum += i
  end
  sum
end

def expon1(base, num)
  return 1 if num.zero?
  
  base * expon1(base, num-1)
end

def expon2(base, num)
  return 1 if num == 0
  if num == 1
    base
  elsif num.even?
    val = expon2(base, num / 2)
    val * val
  else
    val = expon2(base, (num-1) / 2)
    base * (val * val)
  end
end

class Array
  
  def deep_dup
    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el
      end
    end
  end
end


def fibr(num)
  return [] if num == 0
  return [1] if num == 1
  return [1, 1] if num == 2
  
  fib = fibr(num-1)
  fib << fib.last(2).inject(:+)
end


def bin_search(array, target)
  
  return nil if array.empty?
  
  midpoint = array.count / 2
  
  case array[midpoint] <=> target
  when 1
    bin_search(array[0..midpoint-1], target)
  when -1
    sub_problem = bin_search(array[midpoint+1..-1], target)
    return nil if sub_problem.nil?
    (midpoint + sub_problem)+1
  when 0
    midpoint
  end
end

def make_change(amount, coins)
  
  return [] if coins.empty? || amount.zero?
  
  coins.sort.reverse!
  change = []
  
  new_coins, remainder = amount.divmod(coins.first)
  new_coins.times { change << coins.first }
  
  change_1 = change + make_change(remainder, coins[1..-1])
  
  change_2 = [] + make_change(amount, coins[1..-1])
  
  if change_2.count < change_1.count && change_2.any?
    change_2
  else
    change_1
  end
  
end
  

def merge_sort(array)
  
  return array if array.count <= 1
  midpoint = array.count / 2
  a = []
  merge(merge_sort(array[0..(midpoint - 1)]), merge_sort(array[midpoint..-1]))
end


def merge(array1, array2)
  sorted_array = []
  
  while !array1.empty? && !array2.empty?
    if array1.first > array2.first
      sorted_array << array2.shift
    else
      sorted_array << array1.shift
    end
    
  end
  
  if !array1.empty?
    sorted_array += array1
  elsif !array2.empty?
    sorted_array += array2
  end
  sorted_array
end 


def subsets(set)
  return [[]] if set.empty?
  return new_set = subsets([[]]) << set if set.count == 1
  set.each do |el|
    subsets(el)
  end
  
end




