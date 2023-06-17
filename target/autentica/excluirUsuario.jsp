<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="br.ifsp.pw3.model.dao.UsuarioDao, br.ifsp.pw3.model.domain.Usuario" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo.css">
    <title>Excluir Usuário</title>
</head>
<body>
    <h1>Excluir Usuário</h1>
    
    <%-- Obtém o ID do usuário a ser excluído --%>
    <% int id = Integer.parseInt(request.getParameter("id")); %>

    <%-- Cria uma instância do DAO --%>
    <% UsuarioDao dao = new UsuarioDao(); %>

    <%-- Obtém o usuário a ser excluído --%>
    <% Usuario usuario = dao.getUsuario(id); %>

    <%-- Verifica se o usuário existe --%>
    <% if (usuario != null) { %>
        <p>Você tem certeza que deseja excluir o usuário:</p>
        <p><strong>ID:</strong> <%= usuario.getId() %></p>
        <p><strong>Usuário:</strong> <%= usuario.getUsuario() %></p>
        <p><strong>Nome Completo:</strong> <%= usuario.getNomeCompleto() %></p>
        <p><strong>CPF:</strong> <%= usuario.getCpf() %></p>
        <p><strong>E-mail:</strong> <%= usuario.getEmail() %></p>

        <%-- Formulário para confirmar a exclusão --%>
		<a href="excluirUsuario?id=<%= usuario.getId() %>">Excluir</a>
        <form action="excluirUsuario" method="post">
            <input type="hidden" name="id" value="<%= usuario.getId() %>">
            <input type="submit" value="Confirmar Exclusão">
        </form>
    <% } else { %>
        <p>O usuário não foi encontrado.</p>
    <% } %>

    <a href="listaUsuario.jsp">Voltar para a lista de usuários</a>
    
    <footer>
        <h2>IFSP São Carlos</h2>
    </footer>  
</body>
</html>
