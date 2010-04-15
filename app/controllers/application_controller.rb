class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  helper_method :current_user
  
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

end
