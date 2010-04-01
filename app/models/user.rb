class User < ActiveRecord::Base
  validate :identifier, :presence => true, :uniqueness => true
  
  def displayname
    nickname || identifier
  end
end
