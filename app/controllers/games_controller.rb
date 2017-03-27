class GamesController < ApplicationController
	include LudumDareGame
  def index
  end

  def new
    @game = Game.new

    @game_jams = GameJam.all.map { |f| ['Ludum dare ' + f.version.to_s, f.id] }
  end

  def show_games
    current_gamejam
    #@game_jams = @current_organization.game_jams.all
    @games = Game.where(game_jam_id: @current_gamejam)
  end

  def create
    current_gamejam
    @game = @current_gamejam.games.new(game_params)
    if !@game.url.blank?
      @game.name = getTitle(@game.url)
      @game.description = getDescription(@game.url)
      if @game.save
        redirect_to @game
      else
        flash[:danger] = "Please fill all required fields"
        render 'new'
      end
    else
      flash[:danger] = "Please fill URL field"
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
    @images = getImages(@game.url)
  end

  def upvote
    @game = Game.find(params[:id])
    @game.liked_by current_user
    redirect_to @game
  end

  def downvote
    @game = Game.find(params[:id])
    @game.downvote_from current_user
    redirect_to @game
  end


  private

  def game_params
    params.require(:game).permit(:url, :engineName, :year)
  end

end
