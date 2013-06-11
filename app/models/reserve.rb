class Reserve < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :shop_id, :expected_time, :status
end
