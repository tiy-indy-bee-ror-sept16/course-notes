class WelcomeController < ApplicationController

  def index
    @message = "Welcome to ye olde site."
    @lipsums = %w(standard hipster samuel)
  end

  def show
    @possible_phrases = {
      0 => "unknown phrasing",
      1 => "complete lack of surprise",
      2 => "raging bile duct",
      3 => "inflamed sense of rejection"
    }
    @name = params[:name].capitalize
    @phrase = @possible_phrases[params[:id].to_i]
  end

  def lipsum
    @num = (params[:num] || 1).to_i
    # binding.pry
    # puts "Hey" # Same as below, kinda
    Rails.logger.info "_Waves_. Howdy ya'll"
    if params[:lipsum_wanted] == "standard"
      @output = StandardLipsum.output
    elsif params[:lipsum_wanted] == "hipster"
      @output = "Hipster"
    elsif params[:lipsum_wanted] == "samuel"
      @output = "That is a tasty burger."
    else
      @output = "Pick one of standard, hipster or samuel, please."
    end
  end

end
