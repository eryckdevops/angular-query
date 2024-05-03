{
  "pedido": {
    "query": "SELECT pedido.codigo, pedido.status_orcamento, operacao.descricao AS operacao, pedido.observacao_comercial, vendedor.razao_social AS vendedor, pedido.cliente_codigo, pedido.data_emissao, pedido.peso_total, pedido.valor_total_descontos, pedido.valor_total_sem_impostos AS valor_total_produtos, pedido.valor_total_ipi, pedido.valor_total_st, pedido.valor_total_frete, pedido.valor_total_com_impostos, pedido.total_quantidade_un_1, pedido.valor_total_comissao, pedido.porcentagem_total_comissao, pedido.valor_total_sem_descontos,  impressao_pedido.texto_espelho_pedido FROM pedido LEFT JOIN operacao ON operacao.codigo = pedido.operacao_codigo AND operacao._sync_delete = '0' LEFT JOIN vendedor ON vendedor.codigo = pedido.vendedor_codigo AND vendedor._sync_delete = '0' LEFT JOIN  impressao_pedido ON  impressao_pedido.operacao_codigo = pedido.operacao_codigo AND  impressao_pedido._sync_delete = 0 WHERE pedido._sync_delete = '0' AND pedido.codigo = ? AND pedido.filial_codigo = ?",
    "keys": [
      "pedido_codigo",
      "filial_codigo"
    ],
    "subQuery": {
      "cliente": {
        "query": "SELECT cliente.razao_social, cliente.cnpj, cliente.endereco_rua, cliente.endereco_bairro, cliente.endereco_cep, cliente.inscricao_estadual,  municipio.nome AS municipio,  municipio.uf AS estado FROM cliente LEFT JOIN  municipio ON  municipio.codigo = cliente.municipio_codigo_ibge WHERE cliente._sync_delete = '0' AND cliente.codigo = ?",
        "keys": [
          "cliente_codigo"
        ]
      }
    }
  },
  "filial": {
    "query": "SELECT filial.nome, filial.endereco,  filial.numero, filial.bairro, filial.cep,  filial.telefone, municipio.nome AS municipio,  municipio.uf AS estado,  filial.cnpj,  empresa.logo FROM  filial LEFT JOIN  empresa ON  empresa.codigo =  filial.empresa_codigo LEFT JOIN  municipio ON CAST( municipio.codigo AS TEXT) =  filial.municipio WHERE  filial._sync_delete = '0' AND  filial.codigo = ?",
    "keys": ["filial_codigo"]
  },
  "pedido_itens": {
    "array": true,
    "query": "SELECT produto.codigo AS produto_codigo, produto.descricao, produto.ncm, pedido_item.quantidade_un_1, pedido_item.valor_unitario_venda, pedido_item.valor_total_com_impostos, pedido_item.valor_total_ipi, pedido_item.valor_total_st, pedido_item.peso_total FROM pedido_item LEFT JOIN produto ON produto.codigo = pedido_item.produto_codigo WHERE pedido_item._sync_delete = '0' AND pedido_item.pedido_codigo = ? AND pedido_item.filial_codigo = ?",
    "keys": [
      "pedido_codigo",
      "filial_codigo"
    ]
  }
}
