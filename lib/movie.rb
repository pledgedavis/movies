class Movies::Movie 
     @@all = []

    attr_accessor :name, :times #setter/getters for my attr
    


    def initialize(name)
     @name = name 
     @times = times
    #  @times = times 
     save 
    end
# def self.movie_and_times
# @times = times
#     @@all
# end

    def self.all
        
        Movies::Scraper.scraped_movies #returns true and adds scraped_movies to all
        #  Movies::Scraper.scraped_showtimes
        # Movies::Movie.new(movie_name, time)
        @@all
    end


    


    # def times
    #     @times 
    #     Movies::Scraper.scraped_showtimes

    # end


    def save 
      @@all << self
     end
end

# keep track of movies