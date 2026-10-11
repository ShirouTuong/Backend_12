<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create user</title>
    <style>
        body { max-width: 600px; margin: 40px auto; padding: 0 16px; color: #18252d; font: 16px/1.5 system-ui, sans-serif; }
        label { display: block; margin: 16px 0; font-weight: 600; }
        input { box-sizing: border-box; display: block; width: 100%; margin-top: 5px; padding: 10px; border: 1px solid #9eafb5; border-radius: 4px; font: inherit; }
        .error { padding: 10px; background: #fff0ee; color: #8b2418; }
        button, a { display: inline-block; margin-right: 10px; padding: 8px 12px; border: 1px solid #075b4b; border-radius: 4px; background: white; color: #075b4b; font: inherit; text-decoration: none; cursor: pointer; }
    </style>
</head>
<body>
    <h1>Create user</h1>
    <c:if test="${not empty error}"><p class="error"><c:out value="${error}" /></p></c:if>
    <form action="${pageContext.request.contextPath}/users/create" method="post" accept-charset="UTF-8">
        <label>Name <input name="name" maxlength="120" required value="<c:out value='${user.name}' />"></label>
        <label>Email <input type="email" name="email" maxlength="220" required value="<c:out value='${user.email}' />"></label>
        <label>Country <input name="country" maxlength="120" required value="<c:out value='${user.country}' />"></label>
        <button type="submit">Save</button>
        <a href="${pageContext.request.contextPath}/users">Cancel</a>
    </form>
</body>
</html>