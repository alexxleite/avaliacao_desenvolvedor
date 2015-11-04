class CreateVendas < ActiveRecord::Migration
  def change
    create_table :vendas do |t|
      t.string :comprador
      t.text :descricao
      t.float :preco_unitario
      t.integer :quantidade
      t.text :endereco
      t.string :fornecedor

      t.timestamps null: false
    end
  end
end
