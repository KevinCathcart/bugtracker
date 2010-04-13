class Bug < ActiveRecord::Base
  validates :description, :presence => true
  validates :status, :presence => true, :numericality => {:only_integer => true}
  validates :severity, :presence => true, :numericality => {:only_integer => true}
  validates :priority, :presence => true, :numericality => {:only_integer => true}
  validates :creator_id, :presence => true, :numericality => {:only_integer => true}
  validates :product_id, :presence => true, :numericality => {:only_integer => true}
  
  
end
