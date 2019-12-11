task :get_movies_themoviedb => :environment do
    #example = "https://api.themoviedb.org/3/movie/550?api_key=c6257aa54473684712ccc5b617e59020"
    key = "api_key=c6257aa54473684712ccc5b617e59020"
    #page = 1
    #rating = 8
    #request_string = "https://api.themoviedb.org/3/discover/movie?#{key}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=#{page}&vote_average.gte=#{rating}"
    
    request_string_poster = "https://api.themoviedb.org/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg"

    response = HTTParty.get(request_string_poster)
    puts response           

end