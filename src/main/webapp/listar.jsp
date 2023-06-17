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
	<link rel="stylesheet" type="text/css" href="css/style.css">

    <title>Usuários</title>
</head>
<body>
    <h1>Usuários</h1>
	<table>
		<tr>
			<th>Usuário</th>
			<th>Nome</th>
			<th>Ações</th>
		</tr>
		<%
			UsuarioDao usuarioDao = new UsuarioDao();
			List<Usuario> usuarios = usuarioDao.listar();

			for (Usuario usuario : usuarios) {
		%>
		<tr>
			<td><%= usuario.getUsuario() %></td>
			<td><%= usuario.getNome() %></td>
			<td>
				<a href="editarUsuario.jsp?id=<%= usuario.getId() %>">Editar</a>
				<a href="excluirUsuario?id=<%= usuario.getId() %>">Excluir</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<a class="button2"href="index.jsp">SAIR</a>
   
</body>
</html>
