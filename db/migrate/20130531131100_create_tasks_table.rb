
class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table(:tasks) do |t|
      t.string  :name
      t.string  :description
      t.integer :list_id

      t.timestamps
    end
  end
end 
