class Receitum < ActiveRecord::Base

	belongs_to :venda
	
	validates_presence_of :venda_id, :receita_venda, :receita_acumulada

end
