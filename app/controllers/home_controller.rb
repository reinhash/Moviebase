class HomeController < ApplicationController
    def index
        require 'json'
        random_number = rand(137) + Movie.first.id
        @movie = Movie.find(random_number)

        if session[:prefs]
            @prefs = JSON.parse(session[:prefs])
        end
        if @prefs
            puts "printing prefs"
            puts @prefs['action']
        else
            prefs = {action: true,
                    adventure: true,
                    black_comedy: true,
                    comedy: true,
                    concert_performance: true,
                    documentary: true,
                    drama: true,
                    educational: true,
                    horror: true,
                    musical: true, 
                    romantic_comedy: true,
                    thriller: true,
                    western: true}.to_json

                    session[:prefs] = prefs
                    @prefs = prefs
        end
    end

    def random_movie
        puts "test"
    end
end