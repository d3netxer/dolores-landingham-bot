class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	helper_method :current_user, :signed_in?, :return_to

  before_action :disable_peek_by_default
  before_action :authenticate_user!, only: :error

  protected

  def admin?
    signed_in? && current_user.admin?
  end

  def peek_enabled?
    Rails.env.development? || self.admin?
  end

  private

  def current_user
    @current_user ||= find_current_user
  end

  def find_current_user
    if ENV['FORCE_USER_ID'] && !Rails.env.production?
      User.find ENV['FORCE_USER_ID']
    elsif session[:user] && session[:user]['email']
      User.find_or_create_by(email_address: session[:user]['email'])
    end
  end

  def sign_in(user)
    session[:user] ||= {}
    session[:user]['email'] = user.email_address
    @current_user = user
  end

  def sign_out
    reset_session
    @current_user = nil
  end

  def signed_in?
    !!current_user
  end

  def authenticate_user!
    unless signed_in?
      flash[:error] = 'You need to sign in for access to this page.'
      redirect_to root_url(return_to: self.make_return_to("Previous", request.fullpath))
    end
  end

  def disable_peek_by_default
    if cookies[:peek].nil?
      cookies[:peek] = false
    end
  end
end
