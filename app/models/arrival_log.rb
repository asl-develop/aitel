class ArrivalLog < ActiveRecord::Base
  include VipAssosiation
  attr_accessible :arrival_time 
  
  
  
  def arrival_log_exists?
    get_arrival_log > 0 ? true : false
  end

  private
    def get_arrival_log
      arrival_logs = ArrivalLog.arel_table
      start_time = arrival_time.beginning_of_day
      end_time = arrival_time.end_of_day
  
      rel = ArrivalLog.where( '1 = 1' )
      rel = rel.where( arrival_logs[:arrival_time].gteq(start_time))
      rel = rel.where( arrival_logs[:arrival_time].lteq(end_time))
      rel = rel.where(shop_id: shop.id, user_id: user.id)
      rel.count
    end
  
end
