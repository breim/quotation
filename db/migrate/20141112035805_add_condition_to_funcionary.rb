class AddConditionToFuncionary < ActiveRecord::Migration
  def change
  	add_column :funcionaries, :authorized, :boolean
  end
end
