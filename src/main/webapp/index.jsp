<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>MySystem</title>
</head>
<body>
    <h1>Login</h1>
    <form  action="autenticar" id="formulario" method="post">
        <label for="username">Username:</label>
        <input class="dados" type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input class="dados" type="password" id="password" name="password"><br><br>
        <input class="submit" type="submit" value="Login">
    </form>
</body>
</html>
