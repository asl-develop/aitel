class User < ActiveRecord::Base
  has_many :vips
  has_many :shops , through: :vips
  attr_accessible :email, :name, :password_digest




  class << self

    def authenticate(email, password)
      user = find_by_email(email)
      
      puts "++++++++++++"
      if user.present? && 
        user.password_digest == password
        #BCrypt::Password.new(shop.password_digest) == password
        puts "***********"
        return user
      else
        return nil
      end
    end

  end

end
