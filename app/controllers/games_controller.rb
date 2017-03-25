class GamesController < ApplicationController
	include LudumDareGame
  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    unless @game.url.nil?
      flash[:danger] = "Please fill all required fields"
      render 'new'
    else
      @game.name = getTitle(@game.url)
      @game.description = getDescription(@game.url)
      if @game.save
        redirect_to @game
      else
        render 'new'
      end
    end
  end

  def show
    @game = Game.find(params[:id])
    @images = getImages(@game.url)

  end


  private

  def game_params
    params.require(:game).permit(:url, :engineName, :year)
  end

end
