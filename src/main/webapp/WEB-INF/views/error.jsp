<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>

    <h2>Something Went Wrong</h2>

    <p style="color:red;">${error}</p>

    <a href="${pageContext.request.contextPath}/employee/register">
        Back to Registration
    </a>

</body>
</html>