<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        :root {
            --bg: #f8fafc;
            --card: #ffffff;
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --text: #0f172a;
            --muted: #64748b;
            --line: #e2e8f0;
        }
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(180deg, #f8fafc 0%, #eef4ff 100%);
            color: var(--text);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            width: min(560px, 92vw);
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: 18px;
            box-shadow: 0 18px 40px rgba(15, 23, 42, 0.08);
            padding: 28px;
        }
        h2 {
            margin: 0 0 20px;
            font-size: 2rem;
        }
        .field {
            display: flex;
            flex-direction: column;
            margin-bottom: 18px;
        }
        label {
            font-weight: 700;
            margin-bottom: 8px;
        }
        input {
            width: 100%;
            padding: 12px 14px;
            border-radius: 10px;
            border: 1px solid var(--line);
            outline: none;
            font-size: 1rem;
        }
        input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }
        .actions {
            display: flex;
            gap: 12px;
            margin-top: 8px;
            align-items: center;
        }
        .btn {
            border: none;
            border-radius: 10px;
            padding: 12px 18px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        .btn-primary:hover { background: var(--primary-dark); }
        .btn-secondary {
            background: #edf2f7;
            color: var(--text);
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Edit User</h2>
        <form action="${pageContext.request.contextPath}/users/update" method="post">
            <input type="hidden" name="id" value="${user.id}" />
            <div class="field">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="${user.name}" required />
            </div>
            <div class="field">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${user.email}" required />
            </div>
            <div class="field">
                <label for="country">Country</label>
                <input type="text" id="country" name="country" value="${user.country}" required />
            </div>
            <div class="actions">
                <button class="btn btn-primary" type="submit">Update</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/users">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
