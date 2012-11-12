class Hack < ActiveRecord::Base
  attr_accessible :gen, :hackers, :title

  has_many :votes

  before_destroy :ensure_not_referenced_by_any_vote

  validates :title, :hackers, presence: true
  validates :title, uniqueness: true

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
