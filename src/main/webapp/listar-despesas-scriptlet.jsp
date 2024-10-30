<%@ page import="br.com.mh.dao.DespesaDAO" %>
<%@ page import="br.com.mh.model.Despesa" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%--
  JSP - JavaServer Pages
  Permite a junção de código HTML e Scripts Java

  Scriptlet = bloco de código Java incorporado <% %>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Despesas</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>Descrição</th>
        <th>Data</th>
        <th>Categoria</th>
        <th>Valor</th>
    </tr>
    <%
        DespesaDAO dao = new DespesaDAO();
        List<Despesa> despesas = dao.findAll();

        for(Despesa d: despesas){
    %>
    <tr>
        <td><%= d.getId() %></td>
        <td><%= d.getDescricao() %></td>
        <td><%= d.getData().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></td>
        <td><%= d.getCategoria() %></td>
        <td><%= d.getValor() %></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
