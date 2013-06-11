class Customer::ReservesController < Customer::CustomerBase

  def show 
    @reserve = Reserve.includes(:shop).find(params[:id])
  end

  def create

    @reserve = Reserve.new( params[:reserve] )
    @reserve.user_id = @current_user.id

    ActiveRecord::Base.transaction do
      @reserve.save!
      answer = Answer.find( params[:ans_id][:value] )
      answer.selected = Answer::SELECTED
      answer.save!
    end
    redirect_to [:customer, @reserve]
  end

  def check_in
    @reserve = Reserve.find( params[:id]).to_checked_in_state!
    if @reserve.save
      redirect_to [:customer,  @reserve]
    else
      # todo error hundling
      hogehoge
    end

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
