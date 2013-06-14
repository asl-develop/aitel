#coding: utf-8
class User < ActiveRecord::Base
  has_many :vips
  has_many :shops , through: :vips
  has_many :messages
  has_many :wants
  has_many :reserves
  has_many :arrival_logs
  attr_accessible :email, :name, :password_digest


  users = User.arel_table

  scope :not_invited_by,
    ->(shop){
      vip_requests = VipRequest.arel_table
      where(
        VipRequest.by( shop ).requesting.where(
          vip_requests[:user_id].eq( users[:id])).exists.not)
      }

  class << self

    def authenticate(email, password)
      user = find_by_email(email)
      
      if user.present? && 
        user.password_digest == password
        #BCrypt::Password.new(shop.password_digest) == password
        return user
      else
        return nil
      end
    end

    def search( condition , rel)
      return rel if condition.nil?
      return_rel = rel
      if condition.name.present?
        return_rel = return_rel.where( name: condition.name)
      end
      if condition.email.present?
        return_rel = return_rel.where( email: condition.email)
      end
      return return_rel
    end
  end
end
