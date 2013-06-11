class VipRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :status, :user_id

  scope :by, ->(shop){ where( shop_id: shop.id) }
  scope :requesting, ->{ where( status: STATUS_INVITING) }
  scope :sent_to, ->( user ){ where( user_id: user.id  ) }


  STATUS_INVITING = 0
  STATUS_APPROVE = 1
  STATUS_REJECT = 2

end
