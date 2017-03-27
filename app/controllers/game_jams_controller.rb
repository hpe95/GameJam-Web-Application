class GameJamsController < ApplicationController
	def show
		@game_jams = GameJam.all
		render :index
	end

  def new
		@game_jam = GameJam.new
  end

	def create
		@organization = current_organization
		#@organization.save
		#@game_jam = GameJam.new
		@game_jam = @organization.game_jams.new(game_jam_params)
		#puts @game_jam.class
		#@game_jam.theme = @game_jamm.theme
		#@game_jam.date = @game_jamm.date
		#@game_jam.version = @game_jammversion
		#@game_jam.online = @game_jamm.online
		#@game_jam.location = @game_jamm.location
		if @game_jam.save
			flash[:success] = "GameJam event was registered!"
			puts @game_jam.organization_id
			puts @game_jam.theme
			puts @game_jam.version
			puts @game_jam.date
			redirect_to '/game_jams/index'
		else
			flash[:danger] = "Please fill all required fields"
			puts @game_jam.organization_id
			puts @game_jam.theme
			puts @game_jam.version
			puts @game_jam.date
			render :new
		end
	end

		def game_jam_params
			#params.require(:game_jam).permit(:theme, :date, :version, :online, :location)
			params.require(:game_jam).permit!
			puts :organization_id
		end
end
