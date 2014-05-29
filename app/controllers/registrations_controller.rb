class RegistrationsController  < Devise::RegistrationsController

  def create
    super
    session[:new_user] = true
 
  end
  
   protected
    def after_sign_up_path_for(resource)
        "/members/filldetails"
    end
end
