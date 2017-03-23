class GameJamsController < ApplicationController
	def show
		@game_jams = GameJam.all
		render :index
	end

  def new
		@game_jam = GameJam.new
  end

	def create
		@game_jam = GameJam.create(game_jam_params)
		if @game_jam.save
			redirect_to '/game_jams/index'
		else
			render :new
		end
	end

		def game_jam_params
			params.require(:game_jam).permit!
		end
end
