class User < ActiveRecord::Base
  validates :identifier, :presence => true, :uniqueness => true
  
  def displayname
    nickname || identifier
  end
end
