class Customer::AnswersController < Customer::CustomerBase

  def index 
    #TODO : make it select available only
    @answers = @current_user.wants.last.answers.includes( :shop )
    @reserve = Reserve.new
  end

end
