
# coding: utf-8

class ReservesController < ShopBase
  
  def index
    @reserves = @current_shop.reserves.includes(:user).
      order(:updated_at).reverse_order
  end


  def reject
    @reserve = Reserve.find( params[:id]).to_rejected_state!
    if @reserve.save
      redirect_to  :reserves
    else
      # todo error hundling
      hogehoge
    end

  end
  def accept
    @reserve = Reserve.find( params[:id]).to_reserved_state!
    if @reserve.save
      redirect_to  :reserves
    else
      # todo error hundling
      hogehoge
    end

  end

end
