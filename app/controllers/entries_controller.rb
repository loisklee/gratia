class EntriesController < ApplicationController

  # GET: /entries/new
  get "/entries/new" do
    require_login
    erb :"/entries/new.html"
  end

  # POST: /entries
  post "/entries" do
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

  # GET: /entries/5
  get "/entries/:id" do
    require_login
		@user = current_user
		@entry = Entry.find_by_id(params[:id])
		is_current_user 
		@entry_date = @entry.convert_time
    erb :"/entries/show.html"
  end

  # GET: /entries/5/edit
  get "/entries/:id/edit" do
    erb :"/entries/edit.html"
  end

  # PATCH: /entries/5
  patch "/entries/:id" do
    redirect "/entries/:id"
  end

  # DELETE: /entries/5/delete
  delete "/entries/:id/delete" do
    redirect "/entries"
  end
end
