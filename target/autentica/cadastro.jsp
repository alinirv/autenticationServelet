<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo.css">
    <title>Cadastro de Usuario</title>
</head>
<body>
    <h1>Cadastro de Usuário</h1>
    <form action="cadastro"  id="formulario" method="post">
        <label for="usuario">Usuário:</label>
        <input type="text" id="usuario" name="usuario" required><br>
      
        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required><br>
      
        <label for="nomeCompleto">Nome completo:</label>
        <input type="text" id="nomeCompleto" name="nomeCompleto" required><br>
      
        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" required><br>
      
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" required><br>
        <input type="hidden" id="id" name="id" value="-1"><br>
      
        <input type="submit" value="Cadastrar">
      </form>
    <footer>
        <h2>IFSP São Carlos</h2>
    </footer>    
</body>
</html>