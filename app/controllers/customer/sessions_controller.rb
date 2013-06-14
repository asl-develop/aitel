class Customer::SessionsController < Customer::CustomerBase
  skip_before_filter :login_required


  def new
    redirect_to [:customer , @current_user] if logged_in?
  end

  def create
    session.delete(:user_id)
    user = User.authenticate(params[:email],params[:password])

    if user
      session[:user_id] = user.id
      redirect_to params[:from] || [:customer, :root]
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to [:customer, :root]
  end

end
