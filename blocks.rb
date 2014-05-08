class Array
  def my_each
    self.count.times do |i|
      yield self[i]
    end
  end
  
  def my_map
    [].tap do |new_map|
      self.my_each do |i|
        new_map << (yield i)
      end
    end
  end
  
  def my_select
    [].tap do |new_array|
      self.my_each do |i|
        new_array << i if yield i
      end
    end
  end
  
  def my_inject(accum=0, &block)
    self.my_each do |element|
      accum = (block.call(accum, element))
    end
    accum
  end
  
  def my_sort!(&block)
    sorted = false
    
    until sorted
      sorted = true
      (self.count-1).times do |i|
        if block.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    self
  end
  
  def my_sort(&block)
    self.dup.my_sort!(&block)
  end
    
end


def eval_block(*args, &block)
  if block
    block.call(*args)
  else
    puts "No Block Given"
  end
end









