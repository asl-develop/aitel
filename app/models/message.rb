class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :content, :title
  
  scope :sent_to,
    ->( user ){
      where( user_id: user.id  )
    }
  
  
  
end
