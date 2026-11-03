
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
</head>
<body>

<h2>Welcome, ${employee.employeeName}</h2>

<h3>Employee Dashboard</h3>

<p>Employee ID: ${employee.id}</p>

<p>Application Status:
    <strong>${employee.status}</strong>
</p>

<a href="${pageContext.request.contextPath}/employee/status/${employee.id}">
    Check Application Status
</a>

</body>
</html>
