class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Задача успешно создана!'
      redirect_to task_path(@task)
    else
      flash_danger
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = 'Задача успешно обновлена!'
      redirect_to task_path(@task)
    else
      flash_danger
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end


  def flash_danger
    flash.now[:danger] = 'Вы допустили ошибки в своей форме! Пожалуйста, исправьте их.'
  end
end


