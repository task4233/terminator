class TasksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        flash[:success] = "Task created!"
        redirect_to root_url
      else
        flash[:danger] = "Task couldn't create..."
        redirect_to root_url
      end
      format.html{ redirect_to root_path }
    end
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def update 
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end
