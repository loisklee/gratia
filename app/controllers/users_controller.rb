class UsersController < ApplicationController

  get '/about'do
    erb :about
  end

  get '/welcome' do
    @user = current_user
    erb :welcome
  end
  
  get '/logout' do
    session.clear
    redirect to '/'
  end
  
  get '/login' do
    redirect to 'welcome' if logged_in?
    erb :'users/login'
  end

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get '/register' do
    redirect to '/welcome' if logged_in?
    erb :"/users/new.html"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
  
end
