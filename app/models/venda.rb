<<<<<<< HEAD
require 'csv'

class Venda < ActiveRecord::Base

	has_one :receita

	validates_presence_of :comprador, :descricao, :preco_unitario, :quantidade, :endereco, :fornecedor
	#validates_uniqueness_of :comprador

	#alias_attribute :Comprador, :Comprador
	#alias_attribute :descrição, :descricao
	#alias_attribute :Preço, :preco_unitario
	#alias_attribute :Quantidade, :quantidade
	#alias_attribute :Endereço, :endereco
	#alias_attribute :Fornecedor,:fornecedor


	def self.import(file)
		#puts file.read

		#Cria venda e persiste cada linha no db
		CSV.foreach(file.path, headers: true) do |row|
			Venda.create! row.to_hash
			
			#Pega ultimo registro, verifica repetição e delete
			@venda = Venda.last
			comprador = @venda.comprador
			qtd = Venda.where(:comprador => comprador).count		
			if qtd > 1
			   @venda.destroy 
			end

		end
	end

	


end

#{"comprador"=>"João Silva", "descricao"=>"R$10 off R$20 of food", "preco_unitario"=>"10.0", "quantidade"=>"2", "endereco"=>"987 Fake St", "fornecedor"=>"Bob's Pizza"}
=======
class Venda < ActiveRecord::Base

	validates_presence_of :comprador, :descricao, :preco_unitario, :quantidade, :endereco, :fornecedor
end
>>>>>>> b6bf6ca40c7a2ceb486bbcf13cc7fb556249fdea
