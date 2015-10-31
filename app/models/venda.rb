class Venda < ActiveRecord::Base

	validates_presence_of :comprador, :descricao, :preco_unitario, :quantidade, :endereco, :fornecedor
end
