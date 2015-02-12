class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	# Check to see if user exists AND that they can authenticate with the password
  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = "Whoa. It worked!"
  		redirect_to root_path
  	else
  		flash[:notice] = "Something's wrong!"
  	end
  end	

  def destroy
  end
end
