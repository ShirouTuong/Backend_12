<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <style>
        :root {
            --bg: #f5f7fb;
            --card: #ffffff;
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --text: #0f172a;
            --muted: #64748b;
            --line: #e2e8f0;
            --success: #16a34a;
        }
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #eef4ff 0%, #f8fafc 100%);
            color: var(--text);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .shell {
            width: min(900px, 90vw);
            background: rgba(255,255,255,0.7);
            border: 1px solid rgba(148,163,184,0.2);
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.12);
            padding: 48px 40px;
        }
        .badge {
            display: inline-block;
            background: #dbeafe;
            color: var(--primary-dark);
            padding: 8px 14px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            margin-bottom: 20px;
        }
        h1 {
            margin: 0 0 16px;
            font-size: clamp(2rem, 3vw, 3rem);
        }
        p {
            color: var(--muted);
            margin: 0 0 28px;
            font-size: 1.05rem;
        }
        .actions {
            display: flex;
            gap: 18px;
            flex-wrap: wrap;
        }
        .btn {
            display: inline-block;
            text-decoration: none;
            border: none;
            border-radius: 12px;
            padding: 14px 22px;
            font-weight: 700;
            transition: 0.2s ease;
            cursor: pointer;
        }
        .btn-primary {
            background: var(--primary);
            color: #fff;
        }
        .btn-primary:hover { background: var(--primary-dark); }
        .btn-secondary {
            background: #e2e8f0;
            color: var(--text);
        }
        .btn-secondary:hover { background: #cbd5e1; }
    </style>
</head>
<body>
    <div class="shell">
        <div class="badge">Dashboard</div>
        <h1>User Management</h1>
        <p>Simple and modern user administration dashboard.</p>
        <div class="actions">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/users">View users</a>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/users/new">Add new user</a>
        </div>
    </div>
</body>
</html>
