class Answer < ActiveRecord::Base
  belongs_to :want
  belongs_to :shop
  attr_accessible :selected, :status, :shop_id
  
  scope :by, ->(shop){ where( shop_id: shop.id) }
  scope :waiting, ->{ where( status: STATUS_WAITING) }
  

  STATUS_WAITING = 0
  STATUS_OK = 1
  STATUS_NG = 2

  SELECTED = 1
  NON_SELECTED =0 

  def ok?
    self.status == 1
  end
end
