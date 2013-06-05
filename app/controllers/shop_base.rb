class ShopBase < ApplicationController

  before_filter :authorize
  before_filter :login_required

  def authorize
    if session[:shop_id]
      @current_shop = Shop.find_by_id(session[:shop_id])
    end
    session.delete(:shop_id) if @current_shop.nil?

  end

  def login_required
    unless logged_in?
      redirect_to controller: :sessions, action: :new
    end
  end

  def logged_in?
    !!@current_shop
  end

end
