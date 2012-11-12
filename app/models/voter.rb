class Voter < ActiveRecord::Base
  attr_accessible :department, :name

  has_many :votes, dependent: :destroy
  
  validates :name, :department, presence: true
  
end
