class SessionsController < Devise::SessionsController
  
  def new
    super
    puts "Inside session new"
    session[:new_user] = false
  end
  
  def create
    super
        puts "Inside session create"
    session[:new_user] = false
  end
end
