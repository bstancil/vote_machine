class Voter < ActiveRecord::Base
  attr_accessible :department, :name

  has_many :votes, dependent: :destroy
  has_many :hacks, :through => :votes, :uniq => true
  
  validates :name, :department, presence: true
  
  def total_votes
    votes.count
  end
  
  def up_votes
    votes.where(:direction => 1).count
  end
  
  def down_votes
    votes.where(:direction => -1).count
  end

  def gen_avg(gen)
    gen_hacks = Hack.where(:gen => gen).count
    gen_score = votes.where(:gen => gen).sum(:direction)
    gen_score/gen_hacks
  end

  def hack_vote_score(hack)
    sum_score = votes.where(hack_id: hack).sum(:direction)
     
    if sum_score >= 0
      final_score = (1-0.98**sum_score)/(1-0.98)
    else 
      final_score = (1-0.98**sum_score.abs)/(1-0.98)*(sum_score.abs/sum_score)
    end
    final_score
  end
  
  def hack_specific_vote_score(hack,votes)
    sum_score = votes.where(hack_id: hack).sum(:direction)
     
    if sum_score >= 0
      final_score = (1-0.98**sum_score)/(1-0.98)
    else 
      final_score = (1-0.98**sum_score.abs)/(1-0.98)*(sum_score.abs/sum_score)
    end
    final_score
  end

end
