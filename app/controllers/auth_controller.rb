class AuthController < ApplicationController
  skip_before_action :authenticate_user!

  def oauth_callback
    auth = request.env['omniauth.auth']

    session[:token] = auth.credentials.token
    flash[:success] = "You successfully signed in"
    redirect_to root_path
  end
end
