<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Success Page</title>
</head>
<body>

<% String username = request.getParameter("username"); %>

    <h1>Le user "<%= username %>" a bien été ajouté dans la base des données</h1>

</body>
</html>
