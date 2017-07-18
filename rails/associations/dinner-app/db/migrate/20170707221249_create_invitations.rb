class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :guest_id
      t.integer :visited_dinner_id

      t.timestamps
    end
  end
end
