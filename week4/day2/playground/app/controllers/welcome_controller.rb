class WelcomeController < ApplicationController

  def index
    @message = "I'm a cheeky monkey"
    @subtitle = "Moar coffee!!"
    @things_that_suck = %w(DMV Starbucks Budweiser)
    # render plain: @message
    # redirect_to "/marketing/starbucks"
  end

  def bubblegum
    render plain: "Chewing #{params[:flavor]} bubblegum"
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
