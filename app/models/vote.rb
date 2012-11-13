class Vote < ActiveRecord::Base
  attr_accessible :hack, :hack_id, :voter_id, :height, :direction, :width, :gen, :department

  belongs_to :hack
  belongs_to :voter

end
