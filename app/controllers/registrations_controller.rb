class RegistrationsController  < Devise::RegistrationsController

  after_filter :send_mail , only:[:create]
  def create
    super
    session[:new_user] = true

  end
  
   protected
    def after_sign_up_path_for(resource)
        "/members/filldetails"
    end

    def send_mail
    	if !current_user.nil?
    		# UmvoxEmailer.welcome(current_user).deliver	
    	end
    end
end
