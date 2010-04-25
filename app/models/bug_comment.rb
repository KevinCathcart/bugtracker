class BugComment < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  belongs_to :bug
  
  validates :creator, :presence => true
  validates :bug, :presence => true
  validates :content, :presence => true
end
