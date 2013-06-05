class Vip < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :property
end
