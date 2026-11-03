
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f1f5f9;
            color: #1e293b;
        }

        .topbar {
            background: #172554;
            color: white;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }

        .topbar h2 {
            margin: 0;
        }

        .admin-label {
            background: #2563eb;
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 12px;
        }

        .layout {
            display: flex;
            min-height: calc(100vh - 65px);
        }

        .sidebar {
            width: 240px;
            background: white;
            padding: 25px 15px;
            box-shadow: 2px 0 8px rgba(0,0,0,.04);
        }

        .sidebar h3 {
            color: #64748b;
            font-size: 13px;
            padding-left: 12px;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            text-decoration: none;
            color: #334155;
            padding: 13px 12px;
            border-radius: 7px;
            margin-bottom: 7px;
            font-size: 14px;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .main-content {
            flex: 1;
            padding: 35px;
        }

        .welcome h1 {
            margin: 0 0 8px;
            color: #172554;
        }

        .welcome p {
            color: #64748b;
            margin-bottom: 30px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,.05);
            border-left: 5px solid;
        }

        .pending { border-color: #f59e0b; }
        .accepted { border-color: #16a34a; }
        .rejected { border-color: #dc2626; }

        .card h3 {
            color: #64748b;
            font-size: 15px;
            margin: 0 0 15px;
        }

        .card h1 {
            font-size: 35px;
            margin: 0;
        }

        .pending h1 { color: #d97706; }
        .accepted h1 { color: #16a34a; }
        .rejected h1 { color: #dc2626; }

        .quick-links {
            margin-top: 35px;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }

        .quick-links h2 {
            margin-top: 0;
            color: #172554;
        }

        .quick-links a {
            display: inline-block;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 11px 18px;
            border-radius: 6px;
            margin: 7px 7px 0 0;
            font-size: 14px;
        }

        .quick-links a:hover {
            background: #1d4ed8;
        }

        .logout-form button {
            background: #dc2626;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 10px 16px;
            cursor: pointer;
        }

        @media(max-width: 850px) {
            .cards {
                grid-template-columns: 1fr;
            }

            .sidebar {
                width: 180px;
            }

            .main-content {
                padding: 20px;
            }
        }

        @media(max-width: 600px) {
            .layout {
                display: block;
            }

            .sidebar {
                width: 100%;
            }
        }
    </style>
</head>

<body>

<div class="topbar">
    <h2>Employee Management System</h2>

    <div style="display:flex; align-items:center; gap:15px;">
        <span class="admin-label">ADMIN</span>

        <form class="logout-form"
              action="${pageContext.request.contextPath}/admin/logout"
              method="post">

            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">

            <button type="submit">Logout</button>
        </form>
    </div>
</div>

<div class="layout">

    <aside class="sidebar">
        <h3>MAIN MENU</h3>

        <a class="active"
           href="${pageContext.request.contextPath}/admin/dashboard">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/admin/pending">
            Pending Applications
        </a>

        <a href="${pageContext.request.contextPath}/admin/accepted">
            Accepted Employees
        </a>

        <a href="${pageContext.request.contextPath}/admin/rejected">
            Rejected Applications
        </a>
    </aside>

    <main class="main-content">

        <div class="welcome">
            <h1>Admin Dashboard</h1>
            <p>Welcome, Admin! Manage employee registration applications.</p>
        </div>

        <div class="cards">

            <div class="card pending">
                <h3>Pending Applications</h3>
                <h1><c:out value="${totalPending}" default="0"/></h1>
            </div>

            <div class="card accepted">
                <h3>Accepted Applications</h3>
                <h1><c:out value="${totalAccepted}" default="0"/></h1>
            </div>

            <div class="card rejected">
                <h3>Rejected Applications</h3>
                <h1><c:out value="${totalRejected}" default="0"/></h1>
            </div>

        </div>

        <div class="quick-links">
            <h2>Quick Actions</h2>

            <a href="${pageContext.request.contextPath}/admin/pending">
                Review Pending Applications
            </a>

            <a href="${pageContext.request.contextPath}/admin/accepted">
                View Accepted Employees
            </a>

            <a href="${pageContext.request.contextPath}/admin/rejected">
                View Rejected Applications
            </a>
        </div>

    </main>

</div>

</body>
</html>
