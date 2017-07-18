class CreateDinners < ActiveRecord::Migration[5.0]
  def change
    create_table :dinners do |t|
      t.string :name
      t.string :place
      t.datetime :date
      t.integer :host_id

      t.timestamps
    end
    add_index :dinners, :name
  end
end
