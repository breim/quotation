class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.integer :category_id
      t.string :site_url
      t.text :contact
      t.string :location
      t.float :latitude
      t.float :longitude

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size


      t.timestamps
    end
  end
end
