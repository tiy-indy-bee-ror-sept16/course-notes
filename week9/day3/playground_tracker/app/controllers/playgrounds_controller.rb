class PlaygroundsController < ApplicationController

  def index
    if params[:search]
      @playgrounds = Playground.within(
        params[:search][:distance],
        origin: params[:search][:address]
      )
    else
      @playgrounds = Playground.all
    end
    render json: @playgrounds
  end

  def show
    @playground = Playground.find(params[:id])
  end

  def new
    @playground = Playground.new
  end

  def create
    @playground = Playground.new(playground_params)
    if @playground.save
      redirect_to :root
    else
      render :new
    end
  end

  def nearby
    @playground = Playground.find(params[:id])
    render json: @playground.nearby(20)
  end

  private

  def playground_params
    params.require(:playground).permit(:name, :raw_address)
    # {name: "hey", raw_address: "what?"}
    # {playground: {name: "hey", raw_address: "what?"}}
  end

end
