class VipRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :status, :user_id

  scope :by, ->(shop){ where( shop_id: shop.id) }
  scope :requesting, ->{ where( status: STATUS_INVITING) }

  STATUS_INVITING = 0

end
