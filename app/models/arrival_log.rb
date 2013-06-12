class ArrivalLog < ActiveRecord::Base
  include VipAssosiation
  attr_accessible :arrival_time 
end
