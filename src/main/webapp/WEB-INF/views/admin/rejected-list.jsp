
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Rejected Applications</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        * { box-sizing: border-box; font-family: Arial, sans-serif; }

        body { margin: 0; background: #f1f5f9; color: #1e293b; }

        .topbar {
            background: #172554; color: white; padding: 18px 30px;
            display: flex; justify-content: space-between; align-items: center;
        }

        .topbar h2 { margin: 0; font-size: 21px; }

        .admin-label {
            background: #2563eb; padding: 7px 14px;
            border-radius: 20px; font-size: 12px;
        }

        .layout { display: flex; min-height: calc(100vh - 60px); }

        .sidebar { width: 240px; background: white; padding: 25px 15px; }

        .sidebar h3 { color: #64748b; font-size: 13px; padding-left: 12px; }

        .sidebar a {
            display: block; text-decoration: none; color: #334155;
            padding: 13px 12px; border-radius: 7px; margin-bottom: 7px;
            font-size: 14px;
        }

        .sidebar a:hover, .sidebar a.active {
            background: #dbeafe; color: #1d4ed8;
        }

        .main-content { flex: 1; padding: 30px; min-width: 0; }

        .heading h1 { color: #172554; margin: 0 0 8px; }
        .heading p { color: #64748b; margin-bottom: 25px; }

        .table-card {
            background: white; padding: 22px; border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,.05);
            overflow-x: auto;
        }

        table { width: 100%; border-collapse: collapse; min-width: 850px; }

        th, td {
            padding: 14px 12px; text-align: left;
            border-bottom: 1px solid #e2e8f0; font-size: 13px;
            vertical-align: middle;
        }

        th { background: #f8fafc; color: #475569; }

        .status {
            background: #fee2e2; color: #991b1b;
            padding: 6px 10px; border-radius: 20px;
            font-size: 11px; font-weight: bold;
        }

        .reason {
            color: #991b1b; background: #fef2f2;
            padding: 8px; border-radius: 5px;
            max-width: 220px;
        }

        .photo {
            width: 45px; height: 45px; border-radius: 50%;
            object-fit: cover;
        }

        .reconsider-btn {
            background: #2563eb; color: white; border: none;
            padding: 10px 13px; border-radius: 5px; cursor: pointer;
        }

        .reconsider-btn:hover { background: #1d4ed8; }

        .empty {
            text-align: center; padding: 30px; color: #64748b;
        }

        .logout-form button {
            background: #dc2626; color: white; border: none;
            padding: 9px 14px; border-radius: 5px; cursor: pointer;
        }

        @media(max-width: 650px) {
            .layout { display: block; }
            .sidebar { width: 100%; }
            .main-content { padding: 15px; }
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
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}">
            <button type="submit">Logout</button>
        </form>
    </div>
</div>

<div class="layout">

    <aside class="sidebar">
        <h3>MAIN MENU</h3>

        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/pending">Pending Applications</a>
        <a href="${pageContext.request.contextPath}/admin/accepted">Accepted Employees</a>
        <a class="active" href="${pageContext.request.contextPath}/admin/rejected">Rejected Applications</a>
    </aside>

    <main class="main-content">

        <div class="heading">
            <h1>Rejected Applications</h1>
            <p>View rejected registrations and reconsider applications when necessary.</p>
        </div>

        <div class="table-card">

            <h3>Rejected Employee List</h3>

            <c:choose>
                <c:when test="${not empty employees}">

                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Photo</th>
                                <th>Employee Name</th>
                                <th>Gender</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Rejection Reason</th>
                                <th>Status</th>
                                <th>Action</th>
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

                                    <td><c:out value="${emp.employeeName}"/></td>
                                    <td><c:out value="${emp.gender}"/></td>
                                    <td><c:out value="${emp.phoneNumber}"/></td>
                                    <td><c:out value="${emp.address}"/></td>

                                    <td>
                                        <div class="reason">
                                            <c:out value="${emp.rejectionReason}"/>
                                        </div>
                                    </td>

                                    <td>
                                        <span class="status">REJECTED</span>
                                    </td>

                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin/reconsider/${emp.id}"
                                              method="post">

                                            <input type="hidden"
                                                   name="${_csrf.parameterName}"
                                                   value="${_csrf.token}">

                                            <button type="submit"
                                                    class="reconsider-btn">
                                                Re-evaluate
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </c:when>

                <c:otherwise>
                    <div class="empty">
                        <h3>No Rejected Applications</h3>
                        <p>There are currently no rejected registrations.</p>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </main>
</div>

</body>
</html>
