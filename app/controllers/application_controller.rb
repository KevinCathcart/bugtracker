class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  private
  helper_method :current_user, :rpx_url
  
  def current_user
    # Use :find_by_id because :find throws if no record is found
    # while :find_by_id returns nil as desired.
    @current_user ||= User.find_by_id(session[:current_user_id])
  end

  def current_user=(user)
    # Remember to invoke this using self.current_user= to avoid creating
    # a local variable named current_user
    
    # Using Object#try to get nil if there is no method named :id
    # allowing setting the current acount to nil to work as expected
    session[:current_user_id] = user.try(:id)
  end
  
  def rpx_url
    'https://bug-tracker.rpxnow.com/openid/v2/signin?' +
      {:token_url => (url_for :controller => 'sessions', :action => :create, :host => request.host)}.to_query
  end

end
