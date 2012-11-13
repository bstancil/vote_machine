class Voter < ActiveRecord::Base
  attr_accessible :department, :name

  has_many :votes, dependent: :destroy
  
  validates :name, :department, presence: true
  
  def gen_score(gen)
      gen_votes = votes.where(gen: gen)
      gen_votes.sum(:direction)
  end
  
  def total_votes
    votes.count
  end
  
  def total_score
    votes.sum(:direction)
  end
  
  
end
