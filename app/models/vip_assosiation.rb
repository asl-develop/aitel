module VipAssosiation
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    belongs_to :shop
    attr_accessible :user_id, :shop_id
  end

end
