class Hack < ActiveRecord::Base
  attr_accessible :gen, :hackers, :title
  validates :title, :hackers, presence: true
  validates :title, uniqueness: true
end
