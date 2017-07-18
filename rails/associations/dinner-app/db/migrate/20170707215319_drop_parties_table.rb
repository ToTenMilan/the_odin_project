class DropPartiesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :parties
  end
end
