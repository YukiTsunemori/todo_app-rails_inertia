# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    render inertia: "Tasks/Index"
  end
  def new
    render inertia: "Tasks/New"
  end

  def create
    task = Current.user.tasks.build(task_params)

    if task.save
      redirect_to root_path, notice: "タスクは無事作成されました。"
    else
      redirect_to new_task_path, inertia: {errors: task.errors}
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :memo, :deadline_at)
  end
end
