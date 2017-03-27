class OrganizationsController < ApplicationController
  def index
  	@organizations = Organization.all
  	destroy_session_organization
  end

  def show
	@organization = Organization.find(params[:id])
	set_session_organization(@organization)
  end

  def new
		@organization = Organization.new
  end

  def show_jams
  	current_organization
  	#@game_jams = @current_organization.game_jams.all
  	@game_jams = GameJam.where(organization_id: @current_organization)
  end

	def create
		@organization = Organization.create(organization_params)
		if @organization.save
			flash[:success] = "Organization created!"
			redirect_to @organization
		else
			flash[:danger] = "Please fill all required fields"
			render :new
		end
	end

	def organization_params
		params.require(:organization).permit!
	end

end
