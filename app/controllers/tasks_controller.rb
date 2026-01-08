# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update]
  def index
    render inertia: "Tasks/Index", props: {
      tasks: Current.user.tasks.map do |task|
        task.as_json
      end
    }
  end

  def create
    task = Current.user.tasks.build(task_params)

    if task.save
      redirect_to root_path, notice: "タスクが作成されました"
    else
      redirect_to root_path, alert: "タスクの作成に失敗しました"
    end
  end

  def edit
    render inertia: "Tasks/Edit", props: {
      task: {
        id: @task.id,
        name: @task.name,
        memo: @task.memo,
        deadline_at: @task.deadline_at.strftime("%Y-%m-%dT%T")
      }
    }
  end

  def update
    if @task.update(task_params)
      redirect_to edit_task_path(@task), notice: "タスクが編集されました"
    else
      redirect_to edit_task_path(@task), alert: "タスクの更新に失敗しました"
    end
  end

  def destroy
    task = Current.user.tasks.find(params[:id])

    if task.destroy
      redirect_to root_path, notice: "タスクを削除しました"
    else
      redirect_to root_path, alert: "タスクの削除に失敗しました"
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :memo, :deadline_at)
  end

  def set_task
    @task = Current.user.tasks.find(params[:id])
  end
end
