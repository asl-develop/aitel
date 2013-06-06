#coding: utf-8
class Shop < ActiveRecord::Base
  has_many :vips
  has_many :users , through: :vips
  has_many :messages
  attr_accessible :email, :login_id, :name, :password_digest



  class << self

    def authenticate(login_id, password)
      shop = find_by_login_id(login_id)

      if shop.present? && 
        shop.password_digest == password
        #BCrypt::Password.new(user.password_digest) == password
        return shop 
      else
        return nil
      end
    end
  end

end
