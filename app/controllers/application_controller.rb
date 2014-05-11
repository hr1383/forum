class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_meta_tag
   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    session=nil
    root_path
  end

  def after_sign_in_path_for(resource)
        dashboard_members_path
  end
  def set_meta_tag
    
    @meta_title = "You're Voice, Our Fight!"
   @meta_description = " UmVox is a proactive site that helps resolve complaints, gripes, scams, and ripoffs. We also help with reviews, praise, questions, petitions, and protests."
  end
  def authenticate1_user
    if (current_user.nil? && session[:user].nil?)
      redirect_to "/users/sign_in"
    end
  end
end
