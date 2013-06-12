class ArrivalLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :arrival_time, :user_id, :shop_id
end
