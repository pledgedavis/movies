# require 'pry'
class Movies::CLI

# binding.pry
   

    def run #runs whatever method i set inside
        
          puts "
         Hello welcome to Flagship cinemas! "   #greets user
         puts "                 
               Enter 'Hello' to see movies!"
               users_input = gets.strip #asks user for response
               if users_input == "Hello"
        puts "        These are the current movies showing today, please select 1 - 13 "


                    get_movies 
                    list_movies           #applies methods
                    get_user_movie
            #    else
                # users_input = false
               else 
                users_input != "Hello" 
                    puts "wrong input"
            
            end


    end
   
    #   def say_hello
    #     if " " == "hello" && " " == "Hello"
    #      puts "Pick a movie you would like to see."
    #     end
    # end

    def get_movies
        # binding.pry
        #accesses my scraped movies from my scraper class
         Movies::Scraper.scraped_movies
       
          @movie = Movies::Movie.all
          
        # binding.pry
     end
     

    #  def get_times
    #     Movies::Scraper.scraped_showtimes
    #     @movie = Movies::Movie.all
    # end

      
     def list_movies
        puts "--------------------------------------------------------------------"
            # binding.pry
        @movie.each.with_index(1) do |movie, place_on_list|  #iterates over scraped movie area to then put out with an number in front of each movie starting at 1

            puts "#{place_on_list}.#{movie.name}" # A string that actually puts out what the list that the user is seeing 
            
            puts "-------------------------------------------------------------------------"
          
        end

        # puts "Pick a movie you would like to see."
     end
     
    def get_user_movie
        chosen_movie = gets.strip.to_i  
        user_picked_movie_for if valid_input(chosen_movie, @movie)
            
          #uses the valid input method to check correct user input
    end
 
    def valid_input(input, items)
        input.to_i <= items.length && input.to_i > 0 #to_i 
        #checks if user input is greater than 0 but equal list length
    end

    # def self.which_showtime
    #    puts "Choose a time you would like to watch #{movie.name}"
       
    #     name = gets.strip
    #      which_showtime(name)

    # end
    
    # def get_shows
    #     Movies::Scraper.scraped_showtimes
    #     # Movies::Movie.new("superman")
    #      @movie = Movies::Movie.all
    # end

    def user_picked_movie_for
        chosen_movie = gets.chomp
        movie = @movie[chosen_movie.to_i - 1]
       
        
         puts "Good choice on#{movie.name}, what time would you like to see#{movie.name}?"
                #  get_shows
            puts movie.times 

          Movies::Scraper.scraped_movies
          #add scraped movies

         puts "Ok perfect your movie will start at #{movie.times}, enjoy your movie!"

    # binding.pry
    end
end
       # def wrong_input
    
    #    if input >= 14 
    # puts "Sorry enter a number 1 - 13 please"
    # end
#    end

    # def terminate 
    #   if user_picked_movie_for == "end" 
    #     return nil
    #   end 
    #   puts "end" 
    # end 

# end

# puts/prints only and interacting with user