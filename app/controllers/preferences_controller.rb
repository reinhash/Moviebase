class PreferencesController < ApplicationController
    def index
    end

    def create
        prefs = {Action: params[:Action],
        Adventure: params[:Adventure],
        Animation: params[:Animation],
        Comedy: params[:Comedy],
        Crime: params[:Crime],
        Documentary: params[:Documentary],
        Drama: params[:Drama],
        Family: params[:Family],
        Fantasy: params[:Fantasy],
        History: params[:History],
        Horror: params[:Horror],
        Music: params[:Music],
        Mystery: params[:Mystery],
        Romance: params[:Romance],
        Science_fiction: params[:Science_fiction],
        Tv_movie: params[:Tv_movie],
        Thriller: params[:Thriller],
        War: params[:War],
        Western: params[:Western]}.to_json

        session[:prefs] = prefs
        @prefs = prefs
    end

    private
    def preference_params
        params.permit[:Action, :Adventure, :Animation, :Comedy, 
            :Crime, :Documentary, :Drama, :Family, :Fantasy, :History, 
            :Horror, :Music, :Mystery, :Romance, :Science_fiction,
            :Tv_movie, :Thriller, :War, :Western]
    end

end