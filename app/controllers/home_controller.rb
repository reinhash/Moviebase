class HomeController < ApplicationController
    def index
        require 'json'
        if session[:prefs]
            @prefs = JSON.parse(session[:prefs])
            
            sql_selector = []
            @prefs.each do |key, value|
                if value == "on"
                    sql_selector.push(key)
                end
            end
            @filtered_movies = Movie.where(genre: sql_selector)
            random_number = rand(@filtered_movies.length())
            @movie = @filtered_movies[random_number]
            
        else
            prefs = {Action: "on",
                    Adventure: "on",
                    Black_comedy: "on",
                    Comedy: "on",
                    Concert_performance: "on",
                    Documentary: "on",
                    Drama: "on",
                    Educational: "on",
                    Horror: "on",
                    Musical: "on", 
                    Romantic_comedy: "on",
                    Thriller: "on",
                    Western: "on"}.to_json

            session[:prefs] = prefs
            @prefs = prefs

        end
    end
end