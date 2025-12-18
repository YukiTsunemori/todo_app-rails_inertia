# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    render inertia: "Tasks/Index", props: {
      tasks: Current.user.tasks.map do |task|
        task.as_json(
        ).merge(
          edit_url: edit_task_path(task)
        )
      end
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

  def edit
    task = Task.find(params[:id])
    render inertia: "Tasks/Edit", props: {
      task: task.as_json(
        only: %i[id name memo deadline_at]
      )
    }
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      redirect_to edit_task_path(task)
    else
      redirect_to edit_task_path(task), inertia: {errors: task.errors}
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :memo, :deadline_at)
  end
end
