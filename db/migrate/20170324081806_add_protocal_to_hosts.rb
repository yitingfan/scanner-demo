class AddProtocalToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :protocal, :string
  end
end
