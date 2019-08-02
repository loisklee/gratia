class UsersController < ApplicationController
    get '/about'do
        erb :about
    end

    get '/register' do
        redirect to '/welcome' if logged_in?
        erb :'users/register'
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

    get '/login' do
        redirect to 'welcome' if logged_in?
        erb :'users/login'
    end

    post '/login' do
        is_empty?(params, 'login')

        user = User.find_by(:email => params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/welcome'
        else
            if user
                flash[:message] = "Your password is incorrect; please try again."
                redirect to '/login'
            else
                flash[:message] = "The email and password did not match our system records. Please try again or sign up."
                redirect to '/login'
            end
        end
    end

    get '/welcome' do
        require_login
        @user = current_user
        erb :welcome
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end

end