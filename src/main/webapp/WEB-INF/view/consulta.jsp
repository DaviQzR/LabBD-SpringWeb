<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- Importa a biblioteca JSTL (JavaServer Pages Standard Tag Library) para uso de tags JSTL -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- Define a linguagem da página como Java e a codificação como UTF-8 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- Importa a biblioteca JSTL para formatação de dados -->
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Consulta de Produtos</title>
<link rel="stylesheet" href="./css/styles.css"> <!-- Importa o arquivo de estilo CSS -->
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" /> <!-- Inclui o conteúdo do arquivo menu.jsp -->
	</div>

	<br />

	<div align="center" class="container">
		<form action="consulta" method="post"> <!-- Formulário para enviar uma consulta -->
			<p class="title">
				<b>Consulta</b>
			</p>

			<table>
				<tr>
					<td colspan="4" style="text-align: center;"><label
						for="codigo"
						style="display: inline-block; width: 30%; text-align: right;">Valor
							de Entrada:</label> <input class="input_data_id" type="number" min="0"
						step="1" id="valorEntrada" name="valorEntrada"
						placeholder="Valor Entrada" required
						style="display: inline-block; width: 30%;"> <input
						type="submit" id="botao" name="botao" value="Consultar"> <!-- Botão para enviar a consulta -->
					</td>
				</tr>
			</table>
		</form>

		<h2>Resultado da Consulta:</h2>

		<div align="center">
			<c:if test="${not empty erro}"> <!-- Se houver erro, exibe a mensagem de erro -->
				<p style="color: red;">
					<c:out value="${erro }" />
				</p>
			</c:if>
		</div>

		<br />

		<div align="center">
			<c:if test="${not empty produtos}"> <!-- Se houver produtos, exibe a tabela de resultados -->
				<table class="table_round">
					<thead>
						<tr>
							<th>Código</th>
							<th>Nome</th>
							<th>Qtd Estoque</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="produto" items="${produtos}"> <!-- Para cada produto na lista de produtos -->
							<tr>
								<td><c:out value="${produto.codigo }" /></td> <!-- Exibe o código do produto -->
								<td><c:out value="${produto.nome }" /></td> <!-- Exibe o nome do produto -->
								<td><c:out value="${produto.qtdEstoque }" /></td> <!-- Exibe a quantidade em estoque do produto -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<div align="center">
						<div align="center">
							<h3>Quantidade de Produtos Abaixo do valor de "${param.valorEntrada}" é igual a ${qtdEstoque}</h3> <!-- Exibe a quantidade de produtos abaixo do valor de entrada -->
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>
