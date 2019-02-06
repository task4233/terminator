class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :is_done
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
