{
  "pedido": {
    "query": "SELECT pedido.codigo, pedido.status_orcamento, operacao.descricao AS operacao, pedido.observacao_comercial, vendedor.razao_social AS vendedor, pedido.cliente_codigo, pedido.data_emissao, pedido.peso_total, pedido.valor_total_descontos, pedido.valor_total_sem_impostos AS valor_total_produtos, pedido.valor_total_ipi, pedido.valor_total_st, pedido.valor_total_frete, pedido.valor_total_com_impostos, pedido.total_quantidade_un_1, pedido.valor_total_comissao, pedido.porcentagem_total_comissao, pedido.valor_total_sem_descontos, dw_impressao_pedido.texto_espelho_pedido FROM pedido LEFT JOIN operacao ON operacao.codigo = pedido.operacao_codigo AND operacao._sync_delete = '0' LEFT JOIN vendedor ON vendedor.codigo = pedido.vendedor_codigo AND vendedor._sync_delete = '0' LEFT JOIN dw_impressao_pedido ON dw_impressao_pedido.operacao_codigo = pedido.operacao_codigo AND dw_impressao_pedido._sync_delete = 0 WHERE pedido._sync_delete = '0' AND pedido.codigo = ? AND pedido.filial_codigo = ?",
    "keys": [
      "pedido_codigo",
      "filial_codigo"
    ],
    "subQuery": {
      "cliente": {
        "query": "SELECT cliente.razao_social, cliente.cnpj, cliente.endereco_rua, cliente.endereco_bairro, cliente.endereco_cep, cliente.inscricao_estadual, dw_municipio.nome AS municipio, dw_municipio.uf AS estado FROM cliente LEFT JOIN dw_municipio ON dw_municipio.codigo = cliente.municipio_codigo_ibge WHERE cliente._sync_delete = '0' AND cliente.codigo = ?",
        "keys": [
          "cliente_codigo"
        ]
      }
    }
  },
  "filial": {
    "query": "SELECT dw_filial.nome, dw_filial.endereco, dw_filial.numero, dw_filial.bairro, dw_filial.cep, dw_filial.telefone, dw_municipio.nome AS municipio, dw_municipio.uf AS estado, dw_filial.cnpj, dw_empresa.logo FROM dw_filial LEFT JOIN dw_empresa ON dw_empresa.codigo = dw_filial.empresa_codigo LEFT JOIN dw_municipio ON CAST(dw_municipio.codigo AS TEXT) = dw_filial.municipio WHERE dw_filial._sync_delete = '0' AND dw_filial.codigo = ?",
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
