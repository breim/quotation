class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :quote_id
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
