<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.ifsp.pw3.model.domain.Usuario" %>
<%@ page import="br.ifsp.pw3.model.dao.UsuarioDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo.css">
    <title>Usuários</title>
</head>
<body>
    <h1>Usuários</h1>
	<table>
		<tr>
			<th>Usuário</th>
			<th>Nome Completo</th>
			<th>CPF</th>
			<th>E-mail</th>
			<th>Ações</th>
		</tr>
		<%
			// Buscar todos os usuários do banco de dados
			UsuarioDao usuarioDao = new UsuarioDao();
			List<Usuario> usuarios = usuarioDao.listar();

			// Exibir os detalhes de cada usuário
			for (Usuario usuario : usuarios) {
		%>
		<tr>
			<td><%= usuario.getUsuario() %></td>
			<td><%= usuario.getNomeCompleto() %></td>
			<td><%= usuario.getCpf() %></td>
			<td><%= usuario.getEmail() %></td>
			<td>
				<a href="editarUsuario.jsp?id=<%= usuario.getId() %>">Editar</a>
				<a href="excluirUsuario?id=<%= usuario.getId() %>">Excluir</a>
				<!--<a href="excluirUsuario.jsp?id=<%= usuario.getId() %>">Excluir</a>-->
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<a href="index.jsp"><button class="button button2">SAIR</button></a>
    <footer>
        <h2>IFSP São Carlos</h2>
    </footer>  
</body>
</html>
