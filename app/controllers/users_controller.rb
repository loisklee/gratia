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

  get '/register' do
    redirect to '/welcome' if logged_in?
    erb :"/users/new.html"
  end

  post '/register' do
    is_empty?(params, 'register')

    if User.find_by(:email => params[:email])
        flash[:message] = "(This email already exists. Please enter a new email or log in to continue.)"
        redirect to '/register'
    end

    new_user = User.create(params)
    session[:user_id] = new_user.id
    redirect to '/welcome'
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
