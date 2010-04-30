class Solution < ActiveRecord::Base
    has_many :comments, :class_name => 'SolutionComment'
    belongs_to :creator, :class_name => 'User'
    belongs_to :product
    belongs_to :duplicate_of, :class_name => 'Solution'
    has_many :duplicates, :class_name => 'Solution', :foreign_key => 'duplicate_of_id'
    has_and_belongs_to_many :bugs, :validate => true

    STATUSES =[[ 'UNCONFIRMED', 0], ['NEW', 1], ['ASSIGNED', 2], ['REOPENED', 3],['RESOLVED', 4], ['NOTABUG',5],['WONTFIX',6],['DUPLICATE',7],['WORKSFORME',8]]
  validates :creator, :presence => true
  validates :product, :presence => true
  validates :description, :presence => true
  validates :status, :inclusion => { :in => STATUSES.map { |disp, value| value } }
  validates :duplicate_of_id, :numericality => { :allow_nil => true, :only_integer => true }
  
    def number
    "##{id}"
  end
end


