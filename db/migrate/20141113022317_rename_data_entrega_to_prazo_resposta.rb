class RenameDataEntregaToPrazoResposta < ActiveRecord::Migration
  def change
  	rename_column :quotes, :data_entrega, :prazo_de_resposta
  	add_column :quotes, :company_id, :integer
  end
end
