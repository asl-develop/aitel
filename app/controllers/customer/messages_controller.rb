class Customer::MessagesController < Customer::CustomerBase
  
  def index
    @messages = Message.sent_to(@current_user).order("created_at DESC")
  end
  
  def show
    @message = Message.find(params[:id])
  end
end
