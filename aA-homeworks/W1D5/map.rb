class Map

  def initialize
    @pairs = []
  end

  def set(key, value) 
    pair = @pairs.assoc(key) 
    if pair.nil?
      @pairs << [key, value] 
    else  
      pair[1] = value
    end
  end

  def get(key)
    pair = @pairs.assoc(key)
    return nil if pair.nil?
    pair[1]
  end

  def show
    print @pairs
  end
end