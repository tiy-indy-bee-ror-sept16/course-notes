class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by { |post| post.created_at }.reverse
  end

  def show
    @post = Post.find(params[:id])
  end

end
