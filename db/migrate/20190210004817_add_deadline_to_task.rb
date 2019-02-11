class AddDeadlineToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :deadline, :date
    add_column :tasks, :status, :string
  end
end
