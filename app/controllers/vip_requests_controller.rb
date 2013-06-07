#coding: utf-8
class VipRequestsController < ShopBase
  
  before_filter :load_search_condition

  def index
    @vip_requests = @current_shop.vip_requests.requesting.includes(:user)
  end


  def new 
  end

  def create
    @vip_request = VipRequest.new( params[:vip_request])
    @vip_request.shop_id = @current_shop.id
    if @vip_request.save
      redirect_to new_vip_request_path, notice: "#{@vip_request.user.name}様を招待しました。"
    else
      hogehogehoge
    end
  end

  def destroy
    @vip_request = VipRequest.find( params[:id] )
    @vip_request.destroy

    redirect_to :vip_requests
    
  end

  def targets_for

    @users = User.not_invited_by( @current_shop )
    @users = User.search( @search_condition, @users)
    
    html = render_to_string partial: 'targets', locals: { users: @users }
    render json: { data: @users, html: html }

  end

  private
  def load_search_condition
    @search_condition = OpenStruct.new( params[:search_condition] )
    
  end
end
