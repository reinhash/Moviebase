task :get_movies_themoviedb => :environment do
    
  genres_list = [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 12,
      "name": "Adventure"
    },
    {
      "id": 16,
      "name": "Animation"
    },
    {
      "id": 35,
      "name": "Comedy"
    },
    {
      "id": 80,
      "name": "Crime"
    },
    {
      "id": 99,
      "name": "Documentary"
    },
    {
      "id": 18,
      "name": "Drama"
    },
    {
      "id": 10751,
      "name": "Family"
    },
    {
      "id": 14,
      "name": "Fantasy"
    },
    {
      "id": 36,
      "name": "History"
    },
    {
      "id": 27,
      "name": "Horror"
    },
    {
      "id": 10402,
      "name": "Music"
    },
    {
      "id": 9648,
      "name": "Mystery"
    },
    {
      "id": 10749,
      "name": "Romance"
    },
    {
      "id": 878,
      "name": "Science Fiction"
    },
    {
      "id": 10770,
      "name": "TV Movie"
    },
    {
      "id": 53,
      "name": "Thriller"
    },
    {
      "id": 10752,
      "name": "War"
    },
    {
      "id": 37,
      "name": "Western"
    }
  ]


    #example = "https://api.themoviedb.org/3/movie/550?api_key=c6257aa54473684712ccc5b617e59020"
    key = "api_key=c6257aa54473684712ccc5b617e59020"
    page = 2
    rating = 8
    posterbaseurl = "http://image.tmdb.org/t/p/w342/"
    request_string = "https://api.themoviedb.org/3/discover/movie?#{key}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=#{page}&vote_average.gte=#{rating}"

    response = HTTParty.get(request_string)

    response["results"].each do |r|
        #puts r
        poster = posterbaseurl+r['poster_path']
        title = r['original_title']
        plot = r['overview']

        raw_genre = r['genre_ids'][0]
        genres_list.each do |g|
            if g[:id] == raw_genre
                genre = raw_genre
            end 
        end


    end

    #puts response["results"][0]['genre_ids']        

end