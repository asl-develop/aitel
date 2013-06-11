class Customer::WantsController < Customer::CustomerBase
  def new
    @want = Want.new
    @vips = @current_user.vips
  end

  def create
    @want = Want.new( params[:want] )
    @want.user_id = @current_user.id
    shop_ids = params[:answer_ids] || []

    shop_ids.map(&:to_i).each do |shop_id|
      @want.answers.build( shop_id: shop_id, status: 0 ,selected: 0 )
    end

    @want.save

    redirect_to new_customer_want_path
  end
end
