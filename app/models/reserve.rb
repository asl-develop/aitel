class Reserve < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :shop_id, :expected_time, :status

  STATUS_ASKING = 0
  STATUS_RESERVED = 1
  STATUS_CHECKED_IN = 2
  STATUS_REJECTED = 9
  STATUS_CANCELED = 8


  def to_checked_in_state!
    self.status = STATUS_CHECKED_IN
    self
  end

  def to_canceled_state!
    self.status = STATUS_CANCELED
    self
  end

end
