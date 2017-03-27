class OrganizationsController < ApplicationController
  def show
		@organizations = Organization.all
  end

  def new
		@organization = Organization.new
  end

	def create
		@organization = Organization.create(organization_params)
		if @organization.save
			getSessionOrganization(@organization)
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
