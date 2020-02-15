 require 'pry'
 class Movies::Scraper


    # class="displaytitle"
    def self.scraped_movies
        doc = Nokogiri::HTML(open("http://83089.formovietickets.com:2235/"))
        # details = doc.css("select#"a.displaytitle"")
        each_movie = doc.css("a.displaytitle")
        each_showtime = doc.css("a.showtime")
        each_movie.each do |key|
        movie_name = key.text.gsub(/\s+/, " ")  
        
        Movies::Movie.new(movie_name)
        #, show_times)  #makes list of movies available
        # movie_name << each_movies_showtime
        #  binding.pry
        end
            # binding.pry
        each_showtime.each do |show|
            times = show.text.gsub(/\s+/, " ") 
                 binding.pry
                  Movies::Movie.new(times)
         end
    end

   
    # def scraped_showtimes
    #     binding.pry
    #     doc = Nokogiri::HTML(open("http://83089.formovietickets.com:2235/"))
    #     showtime_array = []
    #        each_showtime = doc.css("a.showtime")
            #    each_showtime
            #   each_showtime.each do |showtime_array|
                # movies_showtime = showtime_array.text.gsub(/\s+/, " ") 
                # movies_showtime
                # Movies::Movie.new(movies_showtime)      
                # binding.pry   
            #   end
    # end
end

#     def self.scraped_showtimes
#       website = Nokogiri::HTML(open("http://83089.formovietickets.com:2235/"))


#       each_movies_showtime = website.css("a.showtime")
#       each_movies_showtime.each do |m|
#         puts m.text
       
   #  end
#  end
 # scrape only