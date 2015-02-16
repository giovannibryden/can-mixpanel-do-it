class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = 'Successfully created an account!'
  		log_in user
      redirect_to user
      
  	else
  		flash[:notice] = 'Oops!'
  		render 'new'
    end
  end

  def success
    @user = User.find_by(params[:id])
  end

private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
