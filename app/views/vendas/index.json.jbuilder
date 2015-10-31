json.array!(@vendas) do |venda|
  json.extract! venda, :id, :comprador, :descricao, :preco_unitario, :quantidade, :endereco, :fornecedor
  json.url venda_url(venda, format: :json)
end
