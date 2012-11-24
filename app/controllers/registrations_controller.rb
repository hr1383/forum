class RegistrationsController  < Devise::RegistrationsController

  def create
    super
    session[:new_user] = true
    puts "create is called"
  end
  

end
