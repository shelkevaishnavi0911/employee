
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Pending Applications</title>
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
        }

        .topbar h2 {
            margin: 0;
            font-size: 21px;
        }

        .admin-label {
            background: #2563eb;
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 12px;
        }

        .layout {
            display: flex;
            min-height: calc(100vh - 60px);
        }

        .sidebar {
            width: 240px;
            background: white;
            padding: 25px 15px;
        }

        .sidebar h3 {
            color: #64748b;
            font-size: 13px;
            padding-left: 12px;
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
            padding: 30px;
            min-width: 0;
        }

        .page-heading h1 {
            color: #172554;
            margin: 0 0 8px;
        }

        .page-heading p {
            color: #64748b;
            margin-bottom: 25px;
        }

        .table-card {
            background: white;
            padding: 22px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,.05);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        th, td {
            padding: 14px 12px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
            font-size: 13px;
            vertical-align: middle;
        }

        th {
            background: #f8fafc;
            color: #475569;
        }

        .status {
            background: #fef3c7;
            color: #92400e;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }

        .photo {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
            border: 1px solid #cbd5e1;
        }

        .accept-btn {
            background: #16a34a;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 6px;
        }

        .reject-btn {
            background: #dc2626;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        .reason-input {
            width: 150px;
            padding: 8px;
            border: 1px solid #cbd5e1;
            border-radius: 5px;
            margin-bottom: 6px;
        }

        .empty-message {
            text-align: center;
            padding: 35px;
            color: #64748b;
        }

        .logout-form button {
            background: #dc2626;
            color: white;
            border: none;
            padding: 9px 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        @media(max-width: 650px) {
            .layout {
                display: block;
            }

            .sidebar {
                width: 100%;
            }

            .main-content {
                padding: 15px;
            }
        }
    </style>
</head>

<body>

<div class="topbar">
    <h2>Employee Management System</h2>

    <div style="display:flex; align-items:center; gap:12px;">
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

        <a href="${pageContext.request.contextPath}/admin/dashboard">
            Dashboard
        </a>

        <a class="active"
           href="${pageContext.request.contextPath}/admin/pending">
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

        <div class="page-heading">
            <h1>Pending Applications</h1>
            <p>Review employee registrations and take appropriate action.</p>
        </div>

        <div class="table-card">

            <h3>Pending Queue</h3>

            <c:choose>
                <c:when test="${not empty employees}">

                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Photo</th>
                                <th>Employee Name</th>
                                <th>Gender</th>
                                <th>DOB</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="emp" items="${employees}">
                                <tr>
                                    <td>${emp.id}</td>

                                    <td>
                                        <c:if test="${not empty emp.photoPath}">
                                            <img class="photo"
                                                 src="${pageContext.request.contextPath}/${emp.photoPath}"
                                                 alt="Employee Photo">
                                        </c:if>
                                    </td>

                                    <td>
                                        <c:out value="${emp.employeeName}"/>
                                    </td>

                                    <td>
                                        <c:out value="${emp.gender}"/>
                                    </td>

                                    <td>${emp.dob}</td>

                                    <td>
                                        <c:out value="${emp.phoneNumber}"/>
                                    </td>

                                    <td>
                                        <c:out value="${emp.address}"/>
                                    </td>

                                    <td>
                                        <span class="status">PENDING</span>
                                    </td>

                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin/accept/${emp.id}"
                                              method="post">

                                            <input type="hidden"
                                                   name="${_csrf.parameterName}"
                                                   value="${_csrf.token}">

                                            <button class="accept-btn"
                                                    type="submit">
                                                Accept
                                            </button>
                                        </form>

                                        <form action="${pageContext.request.contextPath}/admin/reject/${emp.id}"
                                              method="post">

                                            <input type="hidden"
                                                   name="${_csrf.parameterName}"
                                                   value="${_csrf.token}">

                                            <input class="reason-input"
                                                   type="text"
                                                   name="reason"
                                                   placeholder="Rejection reason"
                                                   required>

                                            <button class="reject-btn"
                                                    type="submit">
                                                Reject
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </c:when>

                <c:otherwise>
                    <div class="empty-message">
                        <h3>No Pending Applications</h3>
                        <p>There are currently no applications waiting for review.</p>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>

    </main>

</div>

</body>
</html>
