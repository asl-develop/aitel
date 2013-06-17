class Customer::ReservesController < Customer::CustomerBase

  def current
    @reserve = @current_user.reserves.order(:created_at).reverse_order.first
    render :show
  end

  def show 
    @reserve = Reserve.includes(:shop).find(params[:id])
  end

  def create

    @reserve = Reserve.new( params[:reserve] )
    @reserve.user_id = @current_user.id

    ActiveRecord::Base.transaction do
      @reserve.save!
      Want.lock_all_own_by( @current_user )
      answer = Answer.find( params[:ans_id][:value] )
      answer.selected = Answer::SELECTED
      answer.save!
    end
    redirect_to [:customer, @reserve]
  end

  def check_in
    @reserve = Reserve.find( params[:id]).to_checked_in_state!

    ActiveRecord::Base.transaction do
      @reserve.save!
      @arrival_log = ArrivalLog.new( user_id: @current_user.id,
                            shop_id: @reserve.shop.id,
                            arrival_time: Time.now )
        
      @arrival_log.save! unless @arrival_log.arrival_log_exists?
                            
    end
    redirect_to [:customer,  @reserve]
    # todo error hundling
  end

  def cancel
    @reserve = Reserve.find( params[:id]).to_canceled_state!
    if @reserve.save
      redirect_to [:customer,  @reserve]
    else
      # todo error hundling
      hogehoge
    end

  end

end
