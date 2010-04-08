class SessionsController < ApplicationController
  # This is the only controler where we want crosssite requests
  # so skip the scross site request forgery checks.
  skip_before_filter :verify_authenticity_token
  
  # GET /session
  def show
  end

  # POST /session
  def create
    cred=get_credentials(params[:token])
    if cred
      user=User.find_or_create_by_identifier(:identifier=>cred[:identifier])
      user.add_nickname_if_needed(cred[:nickname])
      self.current_user = user
    else
      flash[:notice] = 'Log in failed'
    end
    redirect_to :action => :show
  end

  # DELETE /session
  def destroy
    self.current_user=nil
    redirect_to :action => :show
  end
  
  private
  
  def get_credentials(token)
    u = URI.parse('https://rpxnow.com/api/v2/auth_info')
    req = Net::HTTP::Post.new(u.path)
    req.set_form_data({'token' => token,
                      'apiKey' => '768b9109127648e5779db6b6a7a739a3eddf48ba',
                      'format' => 'json'})

    http = Net::HTTP.new(u.host,u.port)
    http.use_ssl = true if u.scheme == 'https'
    res = http.request(req)

    json_resp = res.body
    json = JSON.parse(json_resp)
    if json['stat'] == 'ok'
      unique_identifier = json['profile']['identifier']
      nickname = json['profile']['preferredUsername']
      nickname ||= json['profile']['displayName']
      {:identifier => unique_identifier, :nickname => nickname}
    else
      nil
    end
  end
end
