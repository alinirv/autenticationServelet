<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.ifsp.pw3.model.dao.UsuarioDao" %>
<%@ page import="br.ifsp.pw3.model.domain.Usuario" %>
<%
    // Verifica se foi fornecido um ID de usuário válido
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
        // Redireciona de volta para a página de usuários se o ID não for fornecido
        response.sendRedirect("usuarios.jsp");
        return;
    }

    int id = Integer.parseInt(idParam);

    // Obtém o usuário pelo ID
    UsuarioDao usuarioDao = new UsuarioDao();
    Usuario usuario = usuarioDao.getUsuario(id);

    if (usuario == null) {
        // Redireciona de volta para a página de usuários se o usuário não existir
        response.sendRedirect("usuarios.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo.css">
    <title>Editar Usuário</title>
</head>
<body>
    <h1>Editar Usuário</h1>
    <form action="editarUsuario" id="formulario" method="post">
        <input type="hidden" name="id" value="<%= usuario.getId() %>">
      
        <label for="usuario">Usuário:</label>
        <input type="text" id="usuario" name="usuario" value="<%= usuario.getUsuario() %>" required><br>
      
        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" value="<%= usuario.getSenha() %>" required><br>
      
        <label for="nomeCompleto">Nome completo:</label>
        <input type="text" id="nomeCompleto" name="nomeCompleto" value="<%= usuario.getNomeCompleto() %>" required><br>
      
        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" value="<%= usuario.getCpf() %>" required><br>
      
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" value="<%= usuario.getEmail() %>" required><br>
      
        <input type="submit" value="Salvar">
    </form>
    <footer>
        <h2>IFSP São Carlos</h2>
    </footer>    
</body>
</html>
