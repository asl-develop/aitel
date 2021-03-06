class Reserve < ActiveRecord::Base
  include VipAssosiation
  attr_accessible :expected_time, :status

  scope :in_action, ->{
    where( status: [ STATUS_ASKING, STATUS_RESERVED ] )
  }

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

  def to_reserved_state!
    self.status = STATUS_RESERVED
    self
  end

  def to_rejected_state!
    self.status = STATUS_REJECTED
    self
  end

end
