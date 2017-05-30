class TasksController < ApplicationController
  def create
	@project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    @task = @project.tasks.update(:status => "new")
    redirect_to project_path(@project)
  end
  
  def show
    @task = Task.find(params[:id])
	@users = User.all
  end
  
	def update
		@task = Task.find(params[:project_id])
		if @task.update(edit_task_params)	
			
			redirect_to @task.project
		else
			render 'edit'
		end
		
		
	end
  
  def edit
	@task = Task.find(params[:project_id])
	@users = User.all
  end
 
 def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to @task.project
	end
	
	private
    def task_params
      params.require(:task).permit(:title, :description, :user_id)
    end
	private
	def edit_task_params
      params.require(:task).permit(:title, :description, :user_id, :status)
    end
	
	def status_task_params
      params.require(:task).permit(:status)
    end
	

	

end
