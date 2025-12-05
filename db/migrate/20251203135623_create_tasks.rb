# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :memo
      t.datetime :completed_at
      t.datetime :deadline_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
