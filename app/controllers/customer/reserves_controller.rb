class Customer::ReservesController < Customer::CustomerBase

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
      ArrivalLog.create!( user_id: @current_user.id,
                          shop_id: @reserve.shop.id,
                          arrival_time: Time.now )
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
