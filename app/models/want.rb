class Want < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  attr_accessible :answer_ids, :amount, :from_date, :locked

  scope :of, ->(user){ where( user_id: user.id ) }
  scope :available, ->{ where( locked: 0 ) }

  class << self
    def lock_all_own_by(user)
      Want.where(user_id: user.id).available.update_all(locked: 1)
    end
  end

end
