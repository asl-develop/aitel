# coding: utf-8
class ArrivalLog < ActiveRecord::Base
  include VipAssosiation
  attr_accessible :arrival_time 
  
  
  
  def arrival_log_exists?
    # todo 一旦なし
    # get_arrival_log > 0 
  end

  private
    def get_arrival_log
      arrival_logs = ArrivalLog.arel_table
      start_time = arrival_time.beginning_of_day
      end_time = arrival_time.end_of_day
  
      rel = ArrivalLog.where( '1 = 1' )
      rel = rel.where( arrival_logs[:arrival_time].gteq(start_time))
      rel = rel.where( arrival_logs[:arrival_time].lteq(end_time))
      rel = rel.where(shop_id: self.shop_id, user_id: self.user_id)
      rel.count
    end
  
end
