<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Confirm deletion</title>
</head>
<body>
    <h1>Confirm deletion</h1>
    <p>Delete user <strong><c:out value="${user.name}" /></strong> (<c:out value="${user.email}" />)?</p>
    <form action="${pageContext.request.contextPath}/users/delete" method="post">
        <input type="hidden" name="id" value="<c:out value='${user.id}' />">
        <button type="submit">Delete user</button>
        <a href="${pageContext.request.contextPath}/users">Cancel</a>
    </form>
</body>
</html>