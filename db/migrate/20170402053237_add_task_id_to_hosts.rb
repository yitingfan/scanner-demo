class AddTaskIdToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :task_id, :integer
  end
end
