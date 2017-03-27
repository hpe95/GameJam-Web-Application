class GameJamsController < ApplicationController
	def index
		@game_jams = GameJam.all
		destroy_session_gamejam		
	end

	def show
		@gamejam = GameJam.find(params[:id])
		set_session_gamejam(@gamejam)
	end

  def new
		@game_jam = GameJam.new
  end

	def create
		current_organization
		@game_jam = @current_organization.game_jams.create(game_jam_params)
		if @game_jam.save
			flash[:success] = "GameJam event was registered!"
			redirect_to '/game_jams/index'
		else
			flash[:danger] = "Please fill all required fields"
			render :new
		end
	end

		def game_jam_params
			params.require(:game_jam).permit!
		end
end