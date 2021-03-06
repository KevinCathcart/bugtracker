class User < ActiveRecord::Base
  validates :identifier, :presence => true, :uniqueness => true

  #attr_accessible :nickname
  
  has_many :created_bugs, :class_name => 'Bug', :foreign_key => 'creator_id'
  has_many :comments, :class_name => 'BugComment', :foreign_key => 'creator_id'
  
  def displayname
    if nickname
      nickname + " (#{identifier_hash})"
    else
      identifier_hash
    end
  end
 
  def add_nickname_if_needed(nick)
     self.nickname||=nick
     save!
  end
 
  private
  
  def identifier_hash
    # 'm0' is the packing code for Base64
    [Digest::SHA1.digest(identifier)].pack('m0')[0..26]
  end

end
