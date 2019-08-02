class EntriesController < ApplicationController

	get '/collection' do
		require_login
		@user = current_user
		# entries = Entry.where(user_id: session[:user_id])
		@entries = @user.entries.sort_by(&:created_at)
		erb :'entries/collection'
	end

	get "/entries/new" do
		require_login
		erb :"/entries/new"
	end

	post '/entries' do	
		if params["gratitude1"] != "" && params["reflection1"] != "" && params["hopes1"] != ""
			@entry = Entry.new(params)
			@entry.user_id = session[:user_id]
			is_current_user 
			@entry.save
			redirect "/entries/#{@entry.id}"
		else
			redirect '/entries/new'
		end
	end

	get '/entries/:id' do
		require_login
		@user = current_user
		@entry = Entry.find_by_id(params[:id])
		is_current_user 
		@entry_date = @entry.convert_time
		erb :'/entries/show'
	end

	get '/entries/:id/edit' do
		require_login
		@entry = Entry.find_by_id(params[:id])
		is_current_user 
		@entry_date = @entry.convert_time
		erb :'/entries/edit'
	end

	patch '/entries/:id' do
		require_login		
		@entry = Entry.find_by_id(params[:id])
		is_current_user 
		@entry.update(thoughts: params["thoughts"].strip, gratitude1: params["gratitude1"], gratitude2: params["gratitude2"], gratitude3: params["gratitude3"], gratitude4: params["gratitude4"], gratitude5: params["gratitude5"], gratitude6: params["gratitude6"], gratitude7: params["gratitude7"], gratitude8: params["gratitude8"], gratitude9: params["gratitude9"], gratitude10: params["gratitude10"], reflection1: params["reflection1"], reflection2: params["reflection2"], reflection3: params["reflection3"], reflection4: params["reflection4"], reflection5: params["reflection5"], hopes1: params["hopes1"], hopes2: params["hopes2"], hopes3: params["hopes3"], hopes4: params["hopes4"], hopes5: params["hopes5"], user_id: current_user.id)				
		redirect "/entries/#{@entry.id}"
	end

	delete '/entries/:id/delete' do
		require_login
		@entry = Entry.find_by_id(params[:id])
		is_current_user 
		@entry.destroy
		redirect '/collection'
	end

end