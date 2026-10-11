<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Users</title>
    <style>
        :root {
            --bg: #f8fafc;
            --card: #ffffff;
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --danger: #dc2626;
            --danger-dark: #b91c1c;
            --text: #0f172a;
            --muted: #64748b;
            --line: #e2e8f0;
            --soft: #eff6ff;
        }
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(180deg, #f8fafc 0%, #eef4ff 100%);
            color: var(--text);
        }
        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 24px;
        }
        .card {
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: 18px;
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.08);
            padding: 28px;
        }
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            margin-bottom: 24px;
        }
        h2 {
            margin: 0;
            font-size: clamp(1.8rem, 2vw, 2.5rem);
        }
        .btn {
            display: inline-block;
            text-decoration: none;
            border: none;
            border-radius: 10px;
            padding: 11px 18px;
            font-weight: 700;
            transition: 0.2s ease;
        }
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        .btn-primary:hover { background: var(--primary-dark); }
        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 12px;
        }
        th, td {
            text-align: left;
            padding: 14px 16px;
            border-bottom: 1px solid var(--line);
        }
        th {
            background: var(--soft);
            color: var(--text);
            font-size: 0.9rem;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }
        tbody tr:hover {
            background: #f8fbff;
        }
        .actions {
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
        }
        .a-edit, .a-delete {
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.92rem;
        }
        .a-edit {
            background: #dbeafe;
            color: #1d4ed8;
        }
        .a-delete {
            background: #fee2e2;
            color: var(--danger-dark);
        }
        .empty { color: var(--muted); font-style: italic; }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="topbar">
                <h2>List Users</h2>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/users/new">Add New User</a>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Country</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty listUsers}">
                            <c:forEach var="user" items="${listUsers}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>${user.country}</td>
                                    <td>
                                        <div class="actions">
                                            <a class="a-edit" href="${pageContext.request.contextPath}/users/edit?id=${user.id}">Edit</a>
                                            <a class="a-delete" href="${pageContext.request.contextPath}/users/delete?id=${user.id}">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="empty">No users found.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
