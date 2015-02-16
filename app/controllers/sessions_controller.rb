class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	# Check to see if user exists AND that they can authenticate with the password
  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = "Whoa. It worked!"
  		log_in user
      render 'success'
  	else
  		flash[:notice] = "Something's wrong!"
      render 'new'
  	end
  end	

  def success
    @email = params[:session][:email]
  end

  def destroy
  end
end
