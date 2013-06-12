#coding: utf-8
class VipsController < ShopBase
  before_filter :load_search_condition
  # GET /users
  # GET /users.json
  def index

    @vips = @current_shop.vips.includes( :user )
    @vips = Vip.search( @search_condition, @vips ).includes(:user )

    @new_arrival_log = ArrivalLog.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vips.to_json(:include => [:user]) }
    end
  end
  
  def show
    @vip = Vip.find(params[:id]) 
  end
  
  def edit
    @vip = Vip.find(params[:id])  
  end

  def update
    @vip = Vip.find(params[:id])
    
    if @vip.update_attributes(params[:vip])
      redirect_to @vip, notice: 'アカウント情報を更新しました。'
    else
      render action: "edit" 
    end
  end
  
  private
  def load_search_condition
    @search_condition = OpenStruct.new( params[:search_condition] )
  end

end
