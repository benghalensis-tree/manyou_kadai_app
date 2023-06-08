class TasksController < ApplicationController

  def index

    if params[:sort_end_date]
      @tasks = Task.order(:end_date)

    elsif params[:search].present?
      if task_name_params.present? && status_params.present?        
        @tasks = Task.search_task_name(task_name_params).search_status(status_params)

      elsif task_name_params.present?        
        @tasks = Task.search_task_name(task_name_params)

      elsif status_params.present?
        @tasks = Task.search_status(status_params)
      end
      
    else
      @tasks = Task.order(created_at: :desc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # redirect_to task_path(@task), notice: "タスクを追加しました!"
      redirect_to @task, notice: "タスクを追加しました!"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました!"
    else
      render :edit
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :content, :status, :priority, :end_date)
  end

  def task_name_params 
    params[:search][:task_name]
  end

  def status_params
    params[:search][:status]
  end

end
