class PreferencesController < ApplicationController
    def index
    end

    def create
      #  prefs = [:action => params[:Action],
       #          :adventure => params[:Adventure],
        #         :black_comedy => params[:Black_comedy],
         #        :comedy => params[:Comedy],
          #       :concert_performance => params[:Concert_performance],
           #      :documentary => params[:Documentary],
            #     :drama => params[:Drama],
             #    :educational => params[:Educational],
              #   :horror => params[:Horror],
               #  :musical => params[:Musical], 
                # :romantic_comedy => params[:Romantic_comedy],
                 #:thriller => params[:Thriller],
                 #:western => params[:Western]]

        prefs = {action: params[:Action],
        adventure: params[:Adventure],
        black_comedy: params[:Black_comedy],
        comedy: params[:Comedy],
        concert_performance: params[:Concert_performance],
        documentary: params[:Documentary],
        drama: params[:Drama],
        educational: params[:Educational],
        horror: params[:Horror],
        musical: params[:Musical], 
        romantic_comedy: params[:Romantic_comedy],
        thriller: params[:Thriller],
        western: params[:Western]}.to_json

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