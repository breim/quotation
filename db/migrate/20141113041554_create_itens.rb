class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.string :name
      t.float :amount,:precision => 8, :scale => 2
      t.string :part_number
      t.integer :quote_id

      t.timestamps
    end
  end
end
