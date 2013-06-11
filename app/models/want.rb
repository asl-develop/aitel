class Want < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  attr_accessible :answer_ids, :amount, :from_date, :locked
end
