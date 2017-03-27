class ApplicationController < ActionController::Base
  include LudumDareGame
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  %w(Gamer Developer).each do |k| 
    define_method "current_#{k.underscore}" do 
        current_user if current_user.is_a?(k.constantize)
    end 

    define_method "authenticate_#{k.underscore}!" do 
    |opts={}| send("current_#{k.underscore}") || not_authorized 
    end 
  end
  

  helper_method :getImages
end
