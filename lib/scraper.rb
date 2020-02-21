 require 'pry'
 class Movies::Scraper

    # class="displaytitle"
    def self.scraped_movies
        doc = Nokogiri::HTML(open("http://83089.formovietickets.com:2235/"))  #the website that i am scraping
        titles_and_times = doc.css("a.displaytitle,a.showtime") #my two links that are being scraped from the website   
        # binding.pry
        movie = {title: nil, times: []}
        # binding.pry
        titles_and_times.each do |element| # iterating over the movie titles and times by each element
            # binding.pry
            if element.attr("class") == "displaytitle" #checking if name is equal to the value returns true
                Movies::Movie.new(movie[:title], movie[:times]) if movie[:title]
                # binding.pry
                movie[:title] = element.text #setting the movie names equal to @name and movie times to @times
                movie[:times] = []
                # binding.pry
            else
                movie[:times] << element.text # if code above isn't executed gonna shovel the name and times to an empty array
                # binding.pry
            end
        end
    
        Movies::Movie.new(movie[:title], movie[:times]) #returns movies with attr accessors from intialize in Movie file
        # binding.pry
    end
end

 # scrape only