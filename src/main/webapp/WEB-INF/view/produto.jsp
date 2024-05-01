<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- Importa a biblioteca JSTL (JavaServer Pages Standard Tag Library) para uso de tags JSTL -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- Configura a página JSP para usar codificação UTF-8 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- Importa a biblioteca JSTL para formatação de dados -->
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href='<c:url value = "./resources/css/styles.css" />'><!-- Importa o arquivo de estilo CSS -->
<title>Produtos</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" /> <!-- Inclui o conteúdo do arquivo menu.jsp -->
	</div>
	<br />
	<div align="center" class="container">
		<form action="produto" method="post">
			<p class="title">
				<b>Manter Produto</b>
			</p>

			<table>
				<tr>
					<td><label for="codigo">Código:</label></td>
					<td><input class="input_data_id" type="number" min="0"
						step="1" id="codigo" name="codigo" placeholder="Código"
						value='<c:out value="${produto.codigo }"></c:out>'></td> <!-- Campo de entrada para o código do produto -->
					<td><input type="submit" id="botao" name="botao"
						value="Buscar"></td> <!-- Botão para buscar o produto pelo código -->
				</tr>
				<tr>
					<td><label for="nome">Nome:</label></td>
					<td><input class="input_data" type="text" id="nome"
						name="nome" placeholder="Nome"
						value='<c:out value="${produto.nome }"></c:out>'></td> <!-- Campo de entrada para o nome do produto -->
				</tr>
				<tr>
					<td><label for="valorUnitario">Valor Unitario:</label></td>
					<td><input class="input_data" type="number" id="valorUnitario"
						name="valorUnitario" placeholder="valor Unitario"
						value='<c:out value="${produto.valorUnitario }"></c:out>'></td> <!-- Campo de entrada para o valor unitário do produto -->
				</tr>
				<tr>
					<td><label for="qtdEstoque">Qtd Estoque:</label></td>
					<td><input class="input_data" type="number" id="qtdEstoque"
						name="qtdEstoque" placeholder="Quantidade Estoque"
						value='<c:out value="${produto.qtdEstoque }"></c:out>'></td> <!-- Campo de entrada para a quantidade em estoque do produto -->
				</tr>
			</table>
			<table>
				<tr>
					<td><input type="submit" id="botao" name="botao"
						value="Cadastrar"></td> <!-- Botão para cadastrar o produto -->
					<td><input type="submit" id="botao" name="botao"
						value="Alterar"></td> <!-- Botão para alterar o produto -->
					<td><input type="submit" id="botao" name="botao"
						value="Excluir"></td> <!-- Botão para excluir o produto -->
					<td><input type="submit" id="botao" name="botao"
						value="Listar"></td> <!-- Botão para listar os produtos -->
				</tr>
			</table>
		</form>
	</div>
	<br />

	<div align="center">
		<c:if test="${not empty erro}"> <!-- Se houver erro, exibe a mensagem de erro -->
			<h2 style="color: red;">
				<b><c:out value="${erro}" /></b>
			</h2>
		</c:if>
	</div>

	<br />
	<div align="center">
		<c:if test="${not empty saida }"> <!-- Se houver saída, exibe a mensagem de saída -->
			<h3>
				<b><c:out value="${saida }" /></b>
			</h3>
		</c:if>
	</div>

	<br />
	<div align="center">
		<c:if test="${not empty produtos }"> <!-- Se houver produtos, exibe a tabela de produtos -->
			<table class="table_round">
				<thead>
					<tr>
						<th>Selecionar</th>
						<th>Código</th>
						<th>Nome</th>
						<th>Valor Unitário</th>
						<th>Quantidade em Estoque</th>
						<th>Excluir</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${produtos }"> <!-- Para cada produto na lista de produtos -->
						<tr>
							<td><input type="radio" name="opcao" value="${p.codigo}"
								onclick="editarProduto(this.value)"
								${p.codigo eq codigoEdicao ? 'checked' : ''} /></td> <!-- Botão de seleção para editar o produto -->
							<td><c:out value="${p.codigo}" /></td> <!-- Exibe o código do produto -->
							<td><c:out value="${p.nome}" /></td> <!-- Exibe o nome do produto -->
							<td style="text-align: center;"><fmt:formatNumber
									value="${p.valorUnitario}" type="currency" currencyCode="BRL" /></td> <!-- Exibe o valor unitário do produto -->
							<td style="text-align: center;"><c:out value="${p.qtdEstoque}" /></td> <!-- Exibe a quantidade em estoque do produto -->
							<td style="text-align: center;">
								<button class="btn-excluir"
									onclick="excluirProduto('${p.codigo}')">Excluir</button> <!-- Botão para excluir o produto -->
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script>
				function consultarProduto(codigo) { <!-- Função para consultar um produto -->
					window.location.href = 'consulta?codigo=' + codigo;
				}
			</script>

			<script>
				function editarProduto(codigo) { <!-- Função para editar um produto -->
					window.location.href = 'produto?cmd=alterar&codigo='
							+ codigo;
				}

				function excluirProduto(codigo) { <!-- Função para excluir um produto -->
					if (confirm("Tem certeza que deseja excluir este produto?")) {
						window.location.href = 'produto?cmd=excluir&codigo='
								+ codigo;
					}
				}
			</script>
		</c:if>
	</div>
</body>
</html>
