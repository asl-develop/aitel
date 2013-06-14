
class Customer::TopController < Customer::CustomerBase
  def want_select
    reserve = @current_user.reserves.in_action.last
    return redirect_to [:customer, reserve] if reserve.present?
    return redirect_to [:customer, :answers] if @current_user.wants.available.count > 0
    redirect_to new_customer_want_path
  end
end
