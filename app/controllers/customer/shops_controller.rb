class Customer::ShopsController < Customer::CustomerBase
  # GET /shops
  # GET /shops.json
  def index
    @shops = @current_user.shops
    #@shops = Shop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

end
