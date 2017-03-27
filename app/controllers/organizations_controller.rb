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

	def create
		@organization = Organization.create(organization_params)
		if @organization.save
			flash[:success] = "Organization created!"
			redirect_to '/organizations/show'
		else
			flash[:danger] = "Please fill all required fields"
			render :new
		end
	end

	def organization_params
		params.require(:organization).permit!
	end

end
