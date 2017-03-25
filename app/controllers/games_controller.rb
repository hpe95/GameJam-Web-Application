class GamesController < ApplicationController
	include LudumDareGame
  def index
    #@game = Game.find(1)
    #@game.name = getTitle("http://ludumdare.com/compo/ludum-dare-35/?action=preview&uid=56711")
    #@game.description = getDescription("http://ludumdare.com/compo/ludum-dare-35/?action=preview&uid=56711")
    #@game.save!
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.name = getTitle(@game.url)
    @game.description = getDescription(@game.url)
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
    @images = getImages(@game.url)
  end


  private
  
  def game_params
    params.require(:game).permit(:url, :engineName)
  end

end
