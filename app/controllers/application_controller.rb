require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
	use Rack::Flash

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "password_security"
		register Sinatra::ActiveRecordExtension
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

		def require_login
			unless logged_in?
				flash[:danger] = "(You must be logged in to view this page.)"
				redirect to '/login'
			end
		end

		def is_empty?(user_hash, route)
			user_hash.each do |att, val|
				if val.empty?
					flash[:message] = "(Please complete all fields.)"
					redirect to "/#{route}"
				end
			end
		end

		def is_current_user
			if !(@entry && @entry.user_id == current_user.id)
				redirect '/welcome'
			end
		end

	end
end
