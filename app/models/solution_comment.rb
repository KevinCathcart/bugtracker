class SolutionComment < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  belongs_to :solution
  
  validates :creator, :presence => true
  validates :solution, :presence => true
  validates :content, :presence => true
end
