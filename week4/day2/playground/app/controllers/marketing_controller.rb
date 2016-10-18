class MarketingController < ApplicationController

  def show
    if params[:thing]
      if params[:thing].upcase == "WVU"
        render :wvu
      else
        @commercial = params[:thing].capitalize
      end
    else
      @commercial = "Budweiser"
    end
  end

  def whatever

  end

end
