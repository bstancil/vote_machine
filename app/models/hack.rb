class Hack < ActiveRecord::Base
  attr_accessible :gen, :hackers, :title, :active_hack, :start_time, :end_time

  has_many :votes
  has_many :voters, :through => :votes, :uniq => true

  validates :title, :hackers, presence: true
  validates :title, uniqueness: true


  def self.all_false_except(hack)
      Hack.update_all :active_hack => false
      hack.update_attributes(:active_hack => true)
  end
  
  def department_votes(department)
      dept_votes = votes.where(department: department)
      dept_votes.sum(:direction)
  end

  def total_score
    votes.sum(:direction)
  end
  
  def adj_score(hack)
    adjusted_score = 0
    voters.includes(:votes).each do |voter|
      adjusted_score += voter.hack_vote_score(self)
    end
    adjusted_score
  end

  def adj_department_score(hack,dept)
    adjusted_score = 0
    voters = Voter.where(department: dept)
    voters.includes(:votes).each do |voter|
      adjusted_score += voter.hack_vote_score(self)
    end
    adjusted_score
  end

  def total_votes
    votes.count
  end
  
  def early_score(hack)
    adjusted_score = 0
    votes = Vote.where(:hack_id => hack.id, :created_at => hack.start_time..hack.start_time + 30)
    voters.includes(:votes).each do |voter|
      adjusted_score += voter.hack_specific_vote_score(self,votes)
    end
    adjusted_score
  end
  
  def late_score(hack)
    adjusted_score = 0
    if hack.end_time
      votes = Vote.where(:hack_id => hack.id, :created_at => hack.end_time - 30..hack.end_time)
      voters.includes(:votes).each do |voter|
        adjusted_score += voter.hack_specific_vote_score(self,votes)
      end
    else
      0
    end
    adjusted_score
  end
  
  def score_change
    Hack.each do |hack|
      early_score(hack) - late_score(hack)
    end
  end  
  
  private
  
    #make sure there are no votes for this hack
    
    def ensure_not_referenced_by_any_vote
      if vote.empty?
        return true
      else
        erros.add(:base, 'Votes Present')
        return false
      end
    end

end
