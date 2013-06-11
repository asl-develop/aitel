# coding: utf-8

class Customer::VipRequestsController < Customer::CustomerBase
  
  def index
    @vip_requests = VipRequest.includes(:shop).sent_to(@current_user).requesting.order("created_at")
  end
  

  def approve
    @vip_request = VipRequest.find(params[:id])
    @vip_request.status = VipRequest::STATUS_APPROVE

# TODO 楽観的ロック必要 
    ActiveRecord::Base.transaction do
      @vip_request.save!
      @vip = Vip.new(user_id: @vip_request.user.id, shop_id: @vip_request.shop.id)
      @vip.save!
    end

    redirect_to controller: :vip_requests, action: :index, notice: "承認しました。"

    rescue => e
      puts e
      puts e.backtrace
      redirect_to controller: :vip_requests, action: :index
  end
  
  def reject
    @vip_request = VipRequest.find(params[:id])
    @vip_request.status = VipRequest::STATUS_REJECT
    if @vip_request.save
      redirect_to controller: :vip_requests, action: :index, notice: "拒否しました。"
    end
  end
  
end
