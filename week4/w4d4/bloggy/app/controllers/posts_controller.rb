class PostsController < ApplicationController

  def index
    @post = Post.where(title: params[:title]).first
    @posts = Post.order(created_at: :desc).offset(1).limit(4)
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.where("id != ?", @post.id)
              .order(created_at: :desc)
              .limit(4)
    render :index
  end

end
