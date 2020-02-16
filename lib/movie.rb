class Movies::Movie 
     @@all = []

    attr_accessor :name, :times #setter/getters for my movie which allow me to give my movies attributes
    
    def initialize(name, times) 
     @name = name 
     @times = times
     @@all << self  # saves all attributes to an array
    end

    def self.all
        @@all  #class method that allows us to put self into the array
    end
end

# keep track of movies