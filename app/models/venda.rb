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

		Venda.calculo_receita

	end

	def self.calculo_receita
	    @vendas = Venda.all
	    total = 0
	    receita = 0
	    @vendas.each do |vd|

	    	if Venda.where(:comprador => vd.comprador).count == 1 && Receitum.where(:venda_id => vd.id).count == 0
		        valor_venda = vd.quantidade * vd.preco_unitario   
		        
		        #se primeiro registro no db, inicializa receita
		        if Receitum.last.nil?
		           Receitum.create(venda_id: vd.id, 
		            receita_venda: valor_venda, 
		            receita_acumulada: valor_venda)  
		        else
		          receita = Receitum.last
		          total = receita.receita_acumulada + valor_venda
		          Receitum.create(venda_id: vd.id, 
		            receita_venda: valor_venda, 
		            receita_acumulada: total)
		        end
		        
		    end
	    end 
  	end

end

#{"comprador"=>"João Silva", "descricao"=>"R$10 off R$20 of food", "preco_unitario"=>"10.0", "quantidade"=>"2", "endereco"=>"987 Fake St", "fornecedor"=>"Bob's Pizza"}

