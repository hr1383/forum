class WelcomeController < ApplicationController

#layout "welcome"
def index
  if session['user']
    redirect_to "/members/dashboard"
  end
  @totalopen = Post.latest_open
  @totalclose = Post.latest_closed
  @testimonials = Post.testimonials
  @isSearch = false
  
end

def logout
    session["user"] = nil
    session["access_token"] = nil
    render :action=>"index"
  end

   
  def login
    session['oauth'] = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::APP_SECRET, Facebook::CALLBACK_URL + 'welcome/callback/')
    puts "login called from welcome"
		redirect_to session['oauth'].url_for_oauth_code(:permissions =>'user_checkins,user_status')
  end
  
  
  
 def callback
		session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect_to '/members/signin'
	end
def terms
end

def privacy
end  

def contact
end

def testimonials
end
end
