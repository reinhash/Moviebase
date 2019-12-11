class PreferencesController < ApplicationController
    def index
    end

    def create
        prefs = {Action: params[:Action],
        Adventure: params[:Adventure],
        Black_comedy: params[:Black_comedy],
        Comedy: params[:Comedy],
        Concert_performance: params[:Concert_performance],
        Documentary: params[:Documentary],
        Drama: params[:Drama],
        Educational: params[:Educational],
        Horror: params[:Horror],
        Musical: params[:Musical], 
        Romantic_comedy: params[:Romantic_comedy],
        Thriller: params[:Thriller],
        Western: params[:Western]}.to_json

        session[:prefs] = prefs
        @prefs = prefs
    end

    private
    def preference_params
        params.permit[:Action, :Adventure, :Black_comedy, :Comedy, 
            :Concert_performance, :Documentary, :Drama, :Educational, 
            :Horror, :Musical, :Romantic_comedy, :Thriller, :Western]
    end

end