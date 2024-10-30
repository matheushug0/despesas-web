<%--
  Created by IntelliJ IDEA.
  User: mateu
  Date: 28/10/2024
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./dist/bootstrap.min.css" rel="stylesheet">
    <title>Cadastro de Despesa</title>
</head>
<body>
<%--        Uso do Expression Language = ${}
--%>
    <h2>Despesa: ${param.descricao} | Valor: ${param.valor.replace(".",",")}</h2>
    <h2>Adicionado com Sucesso.</h2>
</body>
</html>
