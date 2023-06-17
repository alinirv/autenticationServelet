<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.ifsp.pw3.model.dao.UsuarioDao, br.ifsp.pw3.model.domain.Usuario" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <title>Excluir Usuário</title>
</head>
<body>
    <h1>Excluir Usuário</h1>
    
    <% int id = Integer.parseInt(request.getParameter("id")); %>

    <% UsuarioDao dao = new UsuarioDao(); %>

    <% Usuario usuario = dao.getUsuario(id); %>

    <% if (usuario != null) { %>
        <form action="excluir" method="post">
            <input type="hidden" name="id" value="<%= usuario.getId() %>">
            
            <p><strong>ID:</strong> <%= usuario.getId() %></p>
            <input type="hidden" name="usuarioId" value="<%= usuario.getId() %>">
            
            <p><strong>Usuário:</strong> <%= usuario.getUsuario() %></p>
            <input type="hidden" name="usuarioNome" value="<%= usuario.getUsuario() %>">
            
            <p><strong>Nome:</strong> <%= usuario.getNome() %></p>
            
            <input class="submit" type="submit" value="Confirmar Exclusão">
        </form>
    <% } else { %>
        <h3 class="alert">Usuário não encontrado.</h3>
    <% } %>

    <a href="listaUsuario.jsp">Voltar</a>
 
</body>
</html>

