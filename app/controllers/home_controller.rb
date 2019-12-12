class HomeController < ApplicationController
    def default_pref
        prefs = {Action: "on",
                Adventure: "on",
                Animation: "on",
                Comedy: "on",
                Crime: "on",
                Documentary: "on",
                Drama: "on",
                Family: "on",
                Fantasy: "on",
                History: "on",
                Horror: "on",
                Music: "on",
                Mystery: "on",
                Romance: "on",
                Science_fiction: "on",
                Tv_movie: "on",
                Thriller: "on",
                War: "on",
                Western: "on"
            }.to_json

        session[:prefs] = prefs
        @prefs = prefs
    end

    def index
        require 'json'
        if session[:prefs]
            @prefs = JSON.parse(session[:prefs])
            
        else
            default_pref
        end
    end

    def random_movie
        require 'json'
        if session[:prefs]
            @prefs = JSON.parse(session[:prefs])
        else
            default_pref
        end

        sql_selector = []
        @prefs.each do |key, value|
            if value == "on" || key == value
                sql_selector.push(key)
            end
        end
        
        @filtered_movies = Movie.where(genre: sql_selector)
        random_number = rand(@filtered_movies.length())
        @movie = @filtered_movies[random_number]
        
        render json: {prefs: @prefs, movie: @movie}
    end
end