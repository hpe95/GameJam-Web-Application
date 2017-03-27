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

	def set_session_organization(org)
		session[:organization_id] = org.id 
	end

	def destroy_session_organization
		session.delete(:organization_id)
		@current_organization = nil
	end
	def current_organization?(org)
		org == current_organization
	end

	def current_gamejam
		@current_gamejam ||= GameJam.find_by(id: session[:game_jam_id])
	end

	def set_session_gamejam(gamejam)
		session[:game_jam_id] = gamejam.id 
	end

	def destroy_session_gamejam
		session.delete(:game_jam_id)
		@current_gamejam = nil
	end
	def current_gamejam?(gamejam)
		gamejam == current_gamejam
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
