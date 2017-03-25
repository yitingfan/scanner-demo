class AddStateToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :state, :string
  end
end
