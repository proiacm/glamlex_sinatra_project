require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "password_security"
  end

  get "/" do
    if logged_in?
      redirect '/appointments'
    end
    erb :'welcome'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
    def current_user
      User.find(session[:user_id])
    end
  end
end
