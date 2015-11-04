class CreateReceita < ActiveRecord::Migration
  def change
    create_table :receita do |t|
      t.integer :venda_id
      t.float :receita_venda
      t.float :receita_acumulada

      t.timestamps null: false
    end
  end
end
