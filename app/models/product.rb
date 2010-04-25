class Product < ActiveRecord::Base
  
  has_many :bugs
  
  validates :name, :presence => true, :uniqueness => true
  
end
