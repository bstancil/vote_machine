class Hack < ActiveRecord::Base
  attr_accessible :gen, :hackers, :title, :active_hack, :start_time, :end_time

  has_many :votes

  validates :title, :hackers, presence: true
  validates :title, uniqueness: true


  def self.all_false_except(hack)
      Hack.update_all :active_hack => false
      hack.update_attributes(:active_hack => true)
  end
  
  def department_votes(department)
      dept_votes = votes.where(department: department) #, :created_at => :start_time..'2013-01-01 00:00:00')
      dept_votes.sum(:direction)
  end

  def total_score
    votes.sum(:direction)
  end
  
  def total_votes
    votes.count
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
