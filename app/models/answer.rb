class Answer < ActiveRecord::Base
  belongs_to :want
  belongs_to :shop
  attr_accessible :selected, :status, :shop_id
end
