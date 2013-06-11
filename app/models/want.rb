class Want < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  attr_accessible :answer_ids, :amount, :from_date, :locked

  scope :of, ->(user){ where( user_id: user.id ) }
  scope :available, ->(user){ where( locked: 0 ) }
end
