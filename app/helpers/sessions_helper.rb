module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
	    @current_user ||= User.find_by(id: session[:user_id])
	end

	def current_organization
		@current_organization ||= Organization.find_by(id: session[:organization_id])
	end

	def getSessionOrganization(org)
		session[:organization_id] = org.id 
	end

	def current_organization?(org)
		org == current_organization
	end

	def logged_in?
	    !current_user.nil?
	end

	def log_out
	    session.delete(:user_id)
	    @current_user = nil
	end

	def current_user?(user)
		user == current_user
	end
end
