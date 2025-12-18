# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    tasks = Current.user.tasks
    render inertia: "Tasks/Index", props: {
      tasks: tasks
    }
  end

  def create
    task = Current.user.tasks.build(task_params)

    if task.save
      redirect_to root_path
    else
      redirect_to root_path, inertia: {errors: task.errors}
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :memo, :deadline_at)
  end
end
