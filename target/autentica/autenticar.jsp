<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo.css">
    <title>Autenticação de Usuário</title>
</head>
<body>
    <h1>Autentica</h1>
    <form action="autenticar" id="formulario" method="post">
        <label for="usuario">Usuário:</label>
        <input type="text" id="usuario" name="usuario" required><br>
      
        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required><br>
      
        <input type="submit" value="Entrar">
    </form>
    <footer>
        <h2>IFSP São Carlos</h2>
    </footer>  
</body>
</html>
