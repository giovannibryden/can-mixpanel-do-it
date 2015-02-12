class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = user.find_by(:email params[:session][:email].downcase)

  	# Check to see if user exists AND that they can authenticate with the password
  	if user && user
  	end
  end	

  def destroy
  end
end
