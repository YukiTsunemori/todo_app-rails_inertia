# frozen_string_literal: true

class ChangeColumnDatetimeToDate < ActiveRecord::Migration[8.1]
  def change
    change_column :tasks, :deadline_at, :date
  end
end
