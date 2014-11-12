class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.text :description
      t.date :data_entrega
      t.integer :user_id

      t.timestamps
    end
  end
end
