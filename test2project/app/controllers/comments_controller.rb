class CommentsController < ApplicationController
    
 	
  def create
	@task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params)
	redirect_to task_path(@task)
  end
  
  def show
    @comment = Comment.find(params[:task_id])
  end
  
  def update
	@comment = Comment.find(params[:task_id])
	if @comment.update(comment_params)
			redirect_to @comment.task
		else
			render 'edit'
		end
	end
  
  def edit
	@comment = Comment.find(params[:task_id])
  end
 
	def destroy
		@comment = Comment.find(params[:task_id])
		@comment.destroy
		redirect_to @comment.task
	end
 
  private
    def comment_params
	  params.require(:comment).permit(:body, :user_id)
	  
    end


end
