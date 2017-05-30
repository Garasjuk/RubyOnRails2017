class ReportsController < ApplicationController

	def index
		@projects = Project.all
		@tasks = Task.all
		@users = User.all
		
	end
	
	def show
		@project = Project.find(params[:id])
	end
	
end
