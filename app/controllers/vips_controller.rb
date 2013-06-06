#coding: utf-8
class VipsController < ShopBase
  before_filter :load_search_condition
  # GET /users
  # GET /users.json
  def index

    @vips = @current_shop.vips.includes( :user )
    @vips = Vip.search( @search_condition, @vips ).includes(:user )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vips.to_json(:include => [:user]) }
    end
  end

  private
  def load_search_condition
    @search_condition = OpenStruct.new( params[:search_condition] )
  end

end
