class CreateFuncionaries < ActiveRecord::Migration
  def change
    create_table :funcionaries do |t|
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
