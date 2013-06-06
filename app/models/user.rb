#coding: utf-8
class User < ActiveRecord::Base
  has_many :vips
  has_many :shops , through: :vips
  has_many :messages
  attr_accessible :email, :name, :password_digest

  class << self
    def search( condition , rel)
      return rel if condition.nil?
puts condition
puts condition.name
      return_rel = rel
      if condition.name.present?
        return_rel = return_rel.where( name: condition.name)
      end
      return return_rel
    end
  end
end
