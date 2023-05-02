<%--
  Created by IntelliJ IDEA.
  User: 32113
  Date: 2023/3/27
  Time: 20:21:00
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${pageContext.request.contextPath}
    ${user.name}<br>
    ${user.password}<br>


</body>
</html>
