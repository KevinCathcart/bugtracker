class Solution < ActiveRecord::Base
    has_many :comments, :class_name => 'SolutionComment'
    belongs_to :creator, :class_name => 'User'
    belongs_to :product
    belongs_to :duplicate_of, :class_name => 'Solution'
    has_many :duplicates, :class_name => 'Solution', :foreign_key => 'duplicate_of_id'
    has_and_belongs_to_many :bugs, :validate => true, :uniq=>true

    STATUSES =[[ 'IN-DEVELOPMENT', 0], ['UNSTABLE', 1], ['STABLE', 2], ['COMMITTED', 3],['FUBAR', 4], ['REJECTED',5],['DUPLICATE',6]]
    
    validates :creator, :presence => true
    validates :product, :presence => true
    validates :description, :presence => true
    validates :status, :inclusion => { :in => STATUSES.map { |disp, value| value } }
    validates :duplicate_of_id, :numericality => { :allow_nil => true, :only_integer => true }
  
    def number
    "##{id}"
  end
end


