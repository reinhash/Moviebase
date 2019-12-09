
task :get_movies => :environment do
    #response = HTTParty.get('http://www.omdbapi.com/?s=*&apikey=e9bbf01e')
    
    Movie.all.each do |target_movie|
        begin
            #random_number = Movie.first.id #+ rand(137)
            #target_movie = Movie.find(random_number)
            unless target_movie.imdbid
                unless target_movie.poster
                    response = HTTParty.get("http://www.omdbapi.com/?s=#{target_movie.title}}&apikey=e9bbf01e")
                    
                    if response['Search']
                        if response['Search'][0]

                            #target_movie.year = response['Search'][0]['Year']
                            target_movie.imdbid = response['Search'][0]['imdbID']
                            target_movie.poster = response['Search'][0]['Poster']
                            target_movie.save
                            puts "saved: ", target_movie
                        else
                            puts "failed - else:"
                            puts response
                        end
                    end
                end
            end
        rescue
        end
    end

end