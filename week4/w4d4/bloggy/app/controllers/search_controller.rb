class SearchController < ApplicationController

  def index
    @posts = Post.all.select{|post| post.body.include? params[:query] }
  end

end
