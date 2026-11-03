
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Application Status</title>
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

        .header {
            background: #172554;
            color: white;
            padding: 22px 8%;
        }

        .header h2 { margin: 0 0 8px; }
        .header p { margin: 0; color: #cbd5e1; }

        .container {
            max-width: 700px;
            margin: 40px auto;
            padding: 0 15px;
        }

        .card {
            background: white;
            padding: 28px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,.07);
        }

        .application-id {
            background: #f8fafc;
            padding: 18px;
            border-radius: 8px;
            margin-bottom: 22px;
        }

        .application-id h1 {
            color: #172554;
            margin: 8px 0 0;
        }

        .employee-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            margin-bottom: 22px;
        }

        .employee-name { font-size: 19px; font-weight: bold; }

        .details {
            border-top: 1px solid #e2e8f0;
            padding-top: 18px;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            gap: 12px;
            margin: 15px 0;
        }

        .status {
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .pending { background: #fef3c7; color: #92400e; }
        .accepted { background: #dcfce7; color: #166534; }
        .rejected { background: #fee2e2; color: #991b1b; }

        .message {
            margin-top: 22px;
            padding: 16px;
            border-radius: 8px;
            line-height: 1.5;
        }

        .message.pending { background: #fef3c7; }
        .message.accepted { background: #dcfce7; }
        .message.rejected { background: #fee2e2; }

        .error {
            color: #b91c1c;
            background: #fee2e2;
            padding: 15px;
            border-radius: 8px;
        }

        .footer {
            text-align: center;
            color: #64748b;
            margin-top: 20px;
            font-size: 13px;
        }

        @media(max-width: 500px) {
            .detail-row { flex-direction: column; }
            .card { padding: 20px; }
        }
    </style>
</head>

<body>

<div class="header">
    <h2>Employee Portal</h2>
    <p>Employee Registration & Approval Management System</p>
</div>

<div class="container">
    <div class="card">

        <h2>My Application Status</h2>

        <c:choose>

            <c:when test="${not empty error}">
                <div class="error">${error}</div>
            </c:when>

            <c:when test="${not empty employee}">

                <div class="application-id">
                    <small>APPLICATION ID</small>
                    <h1>EMP-${employee.id}</h1>
                </div>

                <div class="employee-row">
                    <div>
                        <div class="employee-name">
                            <c:out value="${employee.employeeName}"/>
                        </div>
                        <small>Employee Registration</small>
                    </div>

                    <c:choose>
                        <c:when test="${employee.status == 'PENDING'}">
                            <span class="status pending">PENDING</span>
                        </c:when>
                        <c:when test="${employee.status == 'ACCEPTED'}">
                            <span class="status accepted">ACCEPTED</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status rejected">REJECTED</span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="details">
                    <h3>Application Details</h3>

                    <div class="detail-row">
                        <span>Employee Name</span>
                        <strong><c:out value="${employee.employeeName}"/></strong>
                    </div>

                    <div class="detail-row">
                        <span>Submitted On</span>
                        <strong>${employee.createdAt}</strong>
                    </div>

                    <div class="detail-row">
                        <span>Application Status</span>
                        <strong>${employee.status}</strong>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${employee.status == 'PENDING'}">
                        <div class="message pending">
                            <strong>Application Under Review</strong><br>
                            Your registration has been submitted successfully.
                            Please wait while the admin reviews your application.
                        </div>
                    </c:when>

                    <c:when test="${employee.status == 'ACCEPTED'}">
                        <div class="message accepted">
                            <strong>Congratulations! Application Accepted</strong><br>
                            Your employee registration has been approved.
                        </div>
                    </c:when>

                    <c:when test="${employee.status == 'REJECTED'}">
                        <div class="message rejected">
                            <strong>Application Rejected</strong><br>
                            Reason:
                            <c:out value="${employee.rejectionReason}"/>
                        </div>
                    </c:when>
                </c:choose>

            </c:when>

            <c:otherwise>
                <div class="error">
                    Application details are unavailable.
                </div>
            </c:otherwise>

        </c:choose>

    </div>

    <div class="footer">
        Employee Registration & Approval Management System
    </div>
</div>

</body>
</html>
