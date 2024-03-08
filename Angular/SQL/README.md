> # Pedido
- :heavy_check_mark:**Query Principal (pedido): Recupera detalhes gerais do pedido, incluindo código, status (se é um orçamento ou um pedido confirmado), observações comerciais, informações do vendedor, código do cliente, data de emissão, pesos totais, valores (descontos, total sem impostos, total com impostos, etc.), total de quantidades, comissão, e um texto espelho para impressão do pedido. Essa consulta é a base para gerar o documento do pedido, incluindo informações operacionais e financeiras.**

- :heavy_check_mark:**Chaves (keys): Identificadores necessários para executar a query, como o código do pedido e o código da filial.**

> # Cliente
- :heavy_check_mark:**SubQuery para Cliente (subQuery.cliente): Recupera detalhes do cliente relacionados ao pedido, como razão social, CNPJ, endereço, bairro, CEP, inscrição estadual, município e estado. Essas informações são essenciais para identificar o cliente no documento do pedido.**

> # Filial

- :heavy_check_mark:**Query para Filial (filial): Busca informações sobre a filial que está emitindo o pedido, incluindo nome, endereço, número, bairro, CEP, telefone, município, estado, CNPJ e logotipo da empresa. Estes dados são usados para preencher o cabeçalho do documento do pedido, identificando a origem do pedido.**

> # Itens do Pedido

- :heavy_check_mark:**Query para Itens do Pedido (pedido_itens): Esta é uma consulta para obter detalhes dos itens incluídos no pedido, como código do produto, descrição, NCM, quantidade, valor unitário de venda, valor total com impostos, valor total do IPI, valor total do ST, e peso total. Os itens do pedido são fundamentais para detalhar o que está sendo comprado ou orçado.**

- :heavy_check_mark:**Cada query é acompanhada por keys, que são os identificadores necessários para filtrar os dados corretos do banco de dados. Por exemplo, para recuperar os itens de um pedido específico, é necessário saber o código do pedido e o código da filial onde o pedido foi feito.**

># Propósito e Uso
- :heavy_check_mark:**As queries são estruturadas para serem usadas em um sistema de gestão empresarial onde pedidos são gerados, impressos e administrados.**

- :heavy_check_mark:**Os dados recuperados formam a base de um documento de pedido ou orçamento que pode incluir informações detalhadas sobre os produtos solicitados, custos, impostos aplicáveis e detalhes tanto do cliente quanto da filial emissora.**

- :heavy_check_mark:**Este documento pode ser usado para fins internos, como controle e planejamento de vendas, ou fornecido aos clientes como um orçamento ou confirmação de pedido.**

- :heavy_check_mark:**O JSON estrutura as informações de maneira lógica para que o sistema possa facilmente acessar, organizar e apresentar os dados necessários para a geração do documento do pedido, facilitando a automação do processo de vendas e gestão de pedidos dentro da empresa.**