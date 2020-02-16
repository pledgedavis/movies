# require 'pry'
class Movies::CLI

# binding.pry
   

    def run #runs whatever method i set inside
       
          puts "
         Hello welcome to Flagship cinemas! "   #greets user
         puts "                 
               Enter 'Hello' to see movies!"
               users_input = gets.strip #asks user for response
               if users_input == "Hello" || users_input == "hello"
        puts "        These are the current movies showing today, please select 1 - 13 "


                    get_movies 
                    list_movies           #applies methods
                    get_user_movie
                else 
                    users_input != "Hello" || users_input != "hello"
                    puts "Wrong input!"
            
                 end
    end
   
    def get_movies
    
         Movies::Scraper.scraped_movies   #accesses my scraped movies from my scraper class
        #  binding.pry
          @movies = Movies::Movie.all #assign @movies to all instance method
       
     end
  
     def list_movies
        puts "--------------------------------------------------------------------"
            # binding.pry
        @movies.each.with_index(1) do |movie, place_on_list|  #iterates over scraped movie area to then put out with an number in front of each movie starting at 1
            # binding.pry
            puts "#{place_on_list}.#{movie.name}" # A string that actually puts out what the list that the user is seeing 
            
            puts "-------------------------------------------------------------------------"
          
        end
     end
     
    def get_user_movie
        @chosen_movie = gets.strip.to_i  
        user_picked_movie_for if valid_input(@chosen_movie, @movies) #uses the valid input method to check correct user input
    end

    def get_user_time
        # binding.pry
        puts "                                                                          
        "
        puts "Select the time you would like to watch #{@current_movie.name}. "
     puts "======================================================================"
    #   binding.pry
      @current_movie.times.each_with_index do |time, num| #iterates over the current movie that the user has chosen and puts out the time for that specific movie.
                # binding.pry
                puts "#{num.to_i + 1}. #{time}"      #gets movie times with a index number 
     puts "======================================================================"          
        end
       
    
        
        @input = gets.strip.to_i - 1 

        puts @current_movie.times[@input] #puts users time for current movie 
        # binding.pry
        
       user_picked_movie_for if valid_input(@chosen_time, @movies)
    #    binding.pry
    end

 
    def valid_input(input, items)
        input.to_i <= items.length && input.to_i > 0 #checks if user input is greater than 0 but equal list length
    end

    def list_times
        puts "--------------------------------------------------------------------"
            # binding.pry
       
                puts @current_movie.times 

    
            
            puts "-------------------------------------------------------------------------"
          
       
     end

     def user_picked_movie_for
        @current_movie = @movies[@chosen_movie.to_i - 1]  #gives current movie chosen vy the user and returns it in the string form below 
        # binding.pry
        puts "================================================================================================="
         puts "Good choice on#{@current_movie.name}, what time would you like to see#{@current_movie.name}?"
                #  get_shows
                list_times
                                          #calls some more methods
                # binding.pry
                get_user_time 
               
       
         puts "====================================================================================================="   
         
         
         puts "Ok perfect your movie will start at #{@current_movie.times[@input]}, enjoy your movie!" #takes current movie and shows times for that specific movie for the user to decide which
    # binding.pry
    end
end
# puts/prints only and interacting with user