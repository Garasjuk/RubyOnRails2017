class UsersController < ApplicationController
		
		
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
		@projects = Project.all
		@tasks = Task.all
	end

	
	def create			
		@user = User.new(user_params)
		if @user.save
			redirect_to log_in_url, :notice => "Signed up!"
		else
			render 'new'
		end
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			if current_user.admin == true 
				redirect_to users_path
			else
				redirect_to projects_path
			end
		else
			redirect_to edit_user_path(@user)
		end
	end
	
	def show
		@user = User.all
	end
	
	def destroy
		@users = User.find(params[:id])
		@users.destroy
		
		redirect_to users_path
	end
	
	private
	def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
	end

	def user_search
			params.require(:user).permit(:first_name, :password)
	end
	
end
