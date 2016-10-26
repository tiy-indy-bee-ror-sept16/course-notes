class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  # Lists all the posts
  def index
    @posts = Post.order(created_at: :desc)
  end

  # A form to make a new post
  def new
    @post = Post.new
  end

  # Creates a new post
  def create
    # render text: params[:post].inspect
    @post = Post.new
    # @post.title = params.[](:post).[](:title)
    @post.title = [:title]
    @post.summary = params[:post][:summary]
    @post.body = params[:post][:body]
    @post.author = params[:post][:author]
    # render text: @post.inspect
    @post.save
    redirect_to root_path
  end

  # Shows a specific post
  def show
  end

  # A form to edit a specific post
  def edit
    render :new
  end

  # Updates a specific post
  def update
    @post.title = params[:post][:title]
    @post.summary = params[:post][:summary]
    @post.body = params[:post][:body]
    @post.author = params[:post][:author]
    # render text: @post.inspect
    @post.save
    redirect_to post_path(id: @post.id)
  end

  # Destroys a specific post
  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end




end
