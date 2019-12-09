
task :get_movies => :environment do
    #response = HTTParty.get('http://www.omdbapi.com/?s=*&apikey=e9bbf01e')
    
    random_number = rand(137) + Movie.first.id
    target_movie = Movie.find(random_number).title

    response = HTTParty.get("http://www.omdbapi.com/?s=#{target_movie}}&apikey=e9bbf01e")
    puts response


end