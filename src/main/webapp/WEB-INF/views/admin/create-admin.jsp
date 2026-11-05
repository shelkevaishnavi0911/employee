<form action="${pageContext.request.contextPath}/admin/create-admin"
      method="post">

    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}" />

    <label>Username:</label>
    <input type="text" name="username" required />

    <label>Password:</label>
    <input type="password" name="password" required />

    <button type="submit">Create Admin</button>
</form>

<p>${success}</p>
<p>${error}</p>