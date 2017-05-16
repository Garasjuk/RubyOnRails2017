class TasksController < ApplicationController
  def create
	@project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    @task = @project.tasks.update(:status => "new")
    redirect_to project_path(@project)
  end
  
  def show
    @task = Task.find(params[:id])
	
  end
  
  def update
	@task = Task.find(params[:project_id])
	if @task.update(task_params)
			redirect_to @task.project
		else
			render 'edit'
		end
	end
  
  def edit
	@task = Task.find(params[:project_id])
  end
 
 def destroy
		@task = Task.find(params[:id])
		@task.destroy
	end
  private
    def task_params
      params.require(:task).permit(:title, :description)
	  
    end


end
