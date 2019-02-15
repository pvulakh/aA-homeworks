class LRUCache
    def initialize(size)
      @cache = Array.new
      @size = size
    end

    def count
      self.cache.length
    end

    def add(el)
      self.cache.delete(el) if self.cache.include?(el)
      
      if self.count == self.size
        self.cache.shift 
        self.cache << el 
      else  
        self.cache << el  
      end 
    end

    def show
      print self.cache
    end

    protected
    attr_reader :size
    attr_accessor :cache

  end