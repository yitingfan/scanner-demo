class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :ip
      t.string :port
      t.string :service
      t.string :version

      t.timestamps
    end
  end
end
