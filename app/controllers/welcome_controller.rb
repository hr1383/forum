class WelcomeController < ApplicationController

layout "welcome"
def index
    if session['user']
      redirect_to "/users/dashboard"
    end
end

def logout
    session["user"] = nil
    session["access_token"] = nil
    render :action=>"index"
  end

   
  def login
    session['oauth'] = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::APP_SECRET, Facebook::CALLBACK_URL + 'welcome/callback/')
		redirect_to session['oauth'].url_for_oauth_code(:permissions =>'friends_checkins')
  end
  
  
  
 def callback
		session['access_token'] = session['oauth'].get_access_token(params[:code])
    puts "got session token"
    puts session['access_token']
    redirect_to '/users/signin'
	end

end
