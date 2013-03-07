class ApplicationController < ActionController::Base
  protect_from_forgery
  
   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    session=nil
    root_path
  end
  
  def authenticate1_user
    puts "---------------"
    puts current_user.nil?
    puts session[:user].nil?
    puts "--------------"
    if (current_user.nil? && session[:user].nil?)
      redirect_to "/users/sign_in"
    end
  end
end
