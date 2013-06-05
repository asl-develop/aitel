class User < ActiveRecord::Base
  has_many :vips
  has_many :shops , through: :vips
  attr_accessible :email, :name, :password_digest
end
