class Bug < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  belongs_to :product
  belongs_to :duplicate_of, :class_name => 'Bug'
  has_many :duplicates, :class_name => 'Bug', :foreign_key => 'duplicate_of_id'
  
  
  PRIORITIES = [[ 'Very High', 5 ],[ 'High' , 4 ],[ 'Moderate', 3 ],[ 'Low', 2 ],[ 'Very Low', 1 ]]
  SEVERITIES =[[ 'Blocker', 0], ['Mostly Non-Trivial', 1], ['Major', 2], ['Normal', 3],['Minor', 4], ['Trivial',5],['Enhancement',6]]
  STATUSES =[[ 'UNCONFIRMED', 0], ['NEW', 1], ['ASSIGNED', 2], ['REOPENED', 3],['RESOLVED', 4], ['NOTABUG',5],['WONTFIX',6],['DUPLICATE',7],['WORKSFORME',8]]
  
  
  validates :creator, :presence => true
  validates :product, :presence => true
  validates :description, :presence => true
  validates :status, :inclusion => { :in => STATUSES.map { |disp, value| value } }
  validates :severity, :inclusion => { :in => SEVERITIES.map { |disp, value| value } }
  validates :priority, :inclusion => { :in => PRIORITIES.map { |disp, value| value } }
  validates :duplicate_of_id, :numericality => { :allow_nil => true, :only_integer => true }
  
  def number
    "##{id}"
  end
  
end
