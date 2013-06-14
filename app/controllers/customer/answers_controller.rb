class Customer::AnswersController < Customer::CustomerBase

  def index 
    #TODO : make it select available only
    @want = @current_user.wants.available.last
    @answers = @want.answers.includes( :shop ) if @want.present?
    @reserve = Reserve.new
  end

end
