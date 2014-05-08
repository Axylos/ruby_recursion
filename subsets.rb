require "set"

def subsets(set)
  s = Set.new 
  s.add set
  return s if set.empty?
  return subsets([]) + [set] if set.count == 1
  
  set.each do |el| 
    s += subsets([el])
    s += subsets(set - [el])
  end  
  
  
  s.sort
end