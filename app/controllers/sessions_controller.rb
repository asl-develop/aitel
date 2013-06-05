class SessionsController < ShopBase
  
  skip_before_filter :login_required

  def new
  end

  def create
    session.delete(:shop_id)
    shop = Shop.authenticate(params[:login_id],params[:password])

    if shop 
      session[:shop_id] = shop.id
      redirect_to params[:from] || :root
    else
      render :new
    end
  end

  def destroy
    session.delete(:shop_id)
    redirect_to :root
  end

end
