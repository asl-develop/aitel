class Customer::WantsController < Customer::CustomerBase
  def new
    @want = Want.new
    @vips = @current_user.vips.includes(:shop)
  end

  def create
    @want = Want.new( params[:want] )
    @want.user_id = @current_user.id
    shop_ids = params[:answer_ids] || []

    shop_ids.map(&:to_i).each do |shop_id|
      @want.answers.build( shop_id: shop_id, status: 0 ,selected: 0 )
    end

    ActiveRecord::Base.transaction do
      Want.lock_all_own_by(@current_user)
      @want.save!
    end
    
    redirect_to [:customer, :answers ]
    
    rescue => e
      puts e
      puts e.backtrace
      render new_customer_want_path
  end
end
