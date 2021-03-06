#coding: utf-8
class Vip < ActiveRecord::Base
  include VipAssosiation
  attr_accessible :property

  scope :by_shop, ->(shop){ where( shop_id: shop.id) }

  class << self
    def search( condition, in_rel )
      return in_rel if condition.brank?

      out_rel = in_rel.includes(:user).merge( User.search( condition, User.where("1=1")))

      vip = Vip.arel_table
      if condition.property.present?
        out_rel = out_rel.where( vip[:property].matches( "%#{condition.property}%" )) 
      end

      out_rel
    end
  end
end

