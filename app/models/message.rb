class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :content, :title
end
