class ArrivalLogsController < ShopBase

  def create
    @arrival_log = ArrivalLog.new( params[:arrival_log] )

    if @arrival_log.arrival_log_exists?
      redirect_to :vips
    else 
      if @arrival_log.save
        redirect_to :vips
      else
        # todo error hundling
        ghogehgoege
      end
    end

  end

end
