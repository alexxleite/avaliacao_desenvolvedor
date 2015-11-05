json.array!(@receita) do |receitum|
  json.extract! receitum, :id, :venda_id, :receita_venda, :receita_acumulada
  json.url receitum_url(receitum, format: :json)
end
