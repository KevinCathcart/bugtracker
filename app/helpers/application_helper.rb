module ApplicationHelper
  def rpx_url
    'https://bug-tracker.rpxnow.com/openid/v2/signin?' +
	{:token_url => (url_for :controller => 'sessions', :action => :create, :host => request.host)}.to_query
  end
end
