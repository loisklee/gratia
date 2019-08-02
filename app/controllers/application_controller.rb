require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    register Sinatra::Flash
  end

  get "/" do
    erb :main
  end

  helpers do 
		
		def logged_in?
			!!current_user
		end 
		
		def current_user
			@current_user ||= User.find_by(id: session[:user_id])
		end
  end
end
