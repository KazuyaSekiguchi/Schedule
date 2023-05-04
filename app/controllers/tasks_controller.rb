class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @schedule_count = Task.count
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @task.save
      flash[:notice] = "新規の予定を追加しました"
      redirect_to :tasks
    else
      render "new"
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
     if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
       flash[:notice] = "IDが「#{@task.id}」の予定を更新しました"
       redirect_to :tasks
     else
       render "edit"
     end
  end
  
  def destroy
     @task = Task.find(params[:id])
     @task.destroy
     flash[:notice] = "予定を削除しました"
     redirect_to :tasks
  end
end
