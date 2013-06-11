class Customer::ReservesController < Customer::CustomerBase
  def new
    @want = Want.new
    @vips = @current_user.vips
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
    redirect_to [:customer, :answers]
  end

end
