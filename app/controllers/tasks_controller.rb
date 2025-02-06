class TasksController < ApplicationController
  before_action :authenticate_user!    # Require login for all actions
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = current_user.tasks  # Show only the current user's tasks
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private

  def set_task
    # Ensure the task belongs to the current user
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end
end
