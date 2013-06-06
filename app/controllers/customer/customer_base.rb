class Customer::CustomerBase < ApplicationController

  before_filter :authorize
  before_filter :login_required

#  layout "provider"

  def authorize
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
      session.delete(:user_id) unless @current_user
    end
  end

  def login_required
    unless logged_in?
      redirect_to controller:  :sessions, action: :new
    end
  end

  def logged_in?
    !!@current_user
  end


end
