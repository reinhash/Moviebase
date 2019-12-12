task :get_movies_themoviedb => :environment do

    def get_genre(genre_input)
        
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

        genres_list.each do |g|
                if g[:id] == genre_input
                    genre = g[:name]
                    return genre
                end
            end
    end

  
    Movie.delete_all

    page = 1
    499.times do
        #example = "https://api.themoviedb.org/3/movie/550?api_key=c6257aa54473684712ccc5b617e59020"
        key = "api_key=c6257aa54473684712ccc5b617e59020"
        rating = 8
        posterbaseurl = "http://image.tmdb.org/t/p/w342/"
        request_string = "https://api.themoviedb.org/3/discover/movie?#{key}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=#{page}&vote_average.gte=#{rating}"

        response = HTTParty.get(request_string)
        
        response["results"].each do |r|
            poster = posterbaseurl+r['poster_path'].to_s
            title = r['original_title']
            plot = r['overview']
            released = r['release_date']
            vote_average = r['vote_average']
            raw_genre = r['genre_ids'][0]
            genre = get_genre(raw_genre)


            all_movies = Movie.new(:title => title, :released => released, :poster => poster, :vote_average => vote_average, :genre => genre, :plot => plot)
            all_movies.save 
        end
        page = page + 1
        puts "done with page: ", page
    end      
end