class HomeController < ApplicationController
    def index
        random_number = rand(137) + Movie.first.id
        @movie = Movie.find(random_number)
    end

    def random_movie
        puts "test"
    end
end