FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 
        'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def slug_oct
  max_fish = ""
  FISH.each do |fish1|
    FISH.each do |fish2|
      max_fish = fish2 if fish2.length > fish1.length
    end 
  end 

  max_fish
end 

def dom_oct
  FISH.merge_sort.last
end 

class Array
  def merge_sort
    return self if self.length <= 1
    mid = self.length / 2 

    left, right = self[0...mid], self[mid..-1]
    sorted_left, sorted_right = left.merge_sort, right.merge_sort
    Array.merge(sorted_left, sorted_right)
  end

  def self.merge(left, right)
    merged = [] 

    until left.empty? || right.empty?
      if left.first.length > right.first.length 
        merged << right.shift 
      else  
        merged << left.shift 
      end 
    end 

    merged + left + right
  end
end 

def clever_oct 
  max_fish = ""
  FISH.each { |fish| max_fish = fish if fish.length > max_fish.length }
  max_fish
end 
