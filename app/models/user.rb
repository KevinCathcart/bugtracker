class User < ActiveRecord::Base
  validates :identifier, :presence => true, :uniqueness => true

  def displayname
    if nickname
      nickname + " (#{identifier})"
    else
      identifier
    end
  end
 
  def add_nickname_if_needed(nick)
     self.nickname||=nick
     save!
  end
 
  private
  # not used right now, but might be used in the display name
  def identifier_hash
    # 'm0' is the packing code for Base64
    Digest::SHA1.digest(identifier).split.pack('m0')
  end

end
