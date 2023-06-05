class TasksController < ApplicationController

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def edit
  end

  def update
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :content, :status, :priority, :end_date)
  end
end
