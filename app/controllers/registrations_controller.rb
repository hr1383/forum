class RegistrationsController  < Devise::RegistrationsController

  def create
    super
#    if verify_recaptcha
#        super
        session[:new_user] = true
#      else
#        build_resource
#        clean_up_passwords(resource)
#        flash[:alert] = "There was an error with the recaptcha code below. Please re-enter the code and click submit."
#        render_with_scope :new
#      end
  return
  end
  
   protected
    def after_sign_up_path_for(resource)
        "/members/filldetails"
    end
#    def after_sign_in_path_for(resource)
#        "www.google.com"
#    end
  
end
