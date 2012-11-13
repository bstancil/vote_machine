class Hack < ActiveRecord::Base
  attr_accessible :gen, :hackers, :title, :active_hack

  has_many :votes

  validates :title, :hackers, presence: true
  validates :title, uniqueness: true


  def self.all_false_instead_of(hack)
      Hack.update_all :active_hack => false
      hack.update_attributes :active_hack => true
  end

  def department_votes(department)
      dept_votes = votes.where(department: department)
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
