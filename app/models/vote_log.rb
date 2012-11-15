class VoteLog < ActiveRecord::Base
  attr_accessible :hack_id, :hack_score, :logged_at, :time_index, :hack
  
  belongs_to :hack
  
end
