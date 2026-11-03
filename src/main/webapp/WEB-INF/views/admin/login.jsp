
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: #f1f5f9;
            display: flex;
            flex-direction: column;
        }

        .header {
            background: #172554;
            color: white;
            padding: 22px 8%;
            text-align: center;
        }

        .header h2 {
            margin: 0 0 7px;
        }

        .header p {
            margin: 0;
            color: #cbd5e1;
            font-size: 14px;
        }

        .login-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 15px;
        }

        .login-card {
            background: white;
            width: 100%;
            max-width: 420px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 22px rgba(0,0,0,.08);
        }

        .icon-circle {
            width: 65px;
            height: 65px;
            border-radius: 50%;
            background: #dbeafe;
            color: #1d4ed8;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 30px;
            margin: 0 auto 18px;
        }

        .login-card h2 {
            text-align: center;
            margin: 0 0 8px;
            color: #172554;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            font-size: 14px;
            margin-bottom: 28px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #2563eb;
        }

        .login-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #1d4ed8;
        }

        .error-message {
            background: #fee2e2;
            color: #b91c1c;
            padding: 12px;
            border-radius: 6px;
            font-size: 14px;
            margin-bottom: 18px;
        }

        .logout-message {
            background: #dcfce7;
            color: #166534;
            padding: 12px;
            border-radius: 6px;
            font-size: 14px;
            margin-bottom: 18px;
        }

        .security-note {
            text-align: center;
            color: #64748b;
            font-size: 12px;
            margin-top: 22px;
        }

        .footer {
            text-align: center;
            padding: 18px;
            color: #64748b;
            font-size: 13px;
        }
    </style>
</head>

<body>

<div class="header">
    <h2>Employee Portal</h2>
    <p>Employee Registration & Approval Management System</p>
</div>

<div class="login-container">

    <div class="login-card">

        <div class="icon-circle">🔐</div>

        <h2>Admin Login</h2>

        <p class="subtitle">
            Sign in to access the administration panel
        </p>

        <c:if test="${param.error != null}">
            <div class="error-message">
                Invalid username or password. Please try again.
            </div>
        </c:if>

        <c:if test="${param.logout != null}">
            <div class="logout-message">
                You have been logged out successfully.
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/login"
              method="post">

            <!-- CSRF Protection -->
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">

            <div class="form-group">
                <label>Username</label>

                <input type="text"
                       name="username"
                       placeholder="Enter admin username"
                       required>
            </div>

            <div class="form-group">
                <label>Password</label>

                <input type="password"
                       name="password"
                       placeholder="Enter password"
                       required>
            </div>

            <button type="submit" class="login-btn">
                Login to Dashboard
            </button>

        </form>

        <div class="security-note">
            🔒 Authorized administrators only
        </div>

    </div>

</div>

<div class="footer">
    Employee Registration & Approval Management System
</div>

</body>
</html>
