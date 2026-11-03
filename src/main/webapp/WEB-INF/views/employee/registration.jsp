
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>

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

        .header h2 {
            margin: 0 0 8px;
        }

        .header p {
            margin: 0;
            color: #cbd5e1;
        }

        .container {
            max-width: 750px;
            margin: 35px auto;
            padding: 0 15px;
        }

        .form-card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.07);
        }

        .form-title {
            margin-top: 0;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e2e8f0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #2563eb;
        }

        textarea {
            resize: vertical;
            min-height: 90px;
        }

        .submit-btn {
            width: 100%;
            background: #2563eb;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #1d4ed8;
        }

        .field-error {
            color: #dc2626;
            font-size: 13px;
            margin-top: 5px;
        }

        .error-box {
            background: #fee2e2;
            color: #b91c1c;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 18px;
        }

        .footer {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            margin-top: 20px;
        }

        @media (max-width: 600px) {
            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .form-card {
                padding: 20px;
            }
        }
    </style>
</head>

<body>

<div class="header">
    <h2>Employee Portal</h2>
    <p>Employee Registration & Approval Management System</p>
</div>

<div class="container">

    <div class="form-card">

        <h2 class="form-title">Employee Registration</h2>

        <c:if test="${not empty error}">
            <div class="error-box">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/employee/register"
              method="post"
              enctype="multipart/form-data">

            <!-- CSRF Protection -->
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}">

            <div class="form-group">
                <label>Employee Name *</label>

                <input type="text"
                       name="employeeName"
                       value="${employee.employeeName}"
                       placeholder="Enter your full name">

                <c:if test="${not empty errors.employeeName}">
                    <div class="field-error">${errors.employeeName}</div>
                </c:if>
            </div>

            <div class="form-row">

                <div class="form-group">
                    <label>Gender *</label>

                    <select name="gender">
                        <option value="">Select Gender</option>
                        <option value="Male"
                            ${employee.gender == 'Male' ? 'selected' : ''}>
                            Male
                        </option>
                        <option value="Female"
                            ${employee.gender == 'Female' ? 'selected' : ''}>
                            Female
                        </option>
                        <option value="Other"
                            ${employee.gender == 'Other' ? 'selected' : ''}>
                            Other
                        </option>
                    </select>

                    <c:if test="${not empty errors.gender}">
                        <div class="field-error">${errors.gender}</div>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Date of Birth *</label>

                    <input type="date"
                           name="dob"
                           value="${employee.dob}">

                    <c:if test="${not empty errors.dob}">
                        <div class="field-error">${errors.dob}</div>
                    </c:if>
                </div>

            </div>

            <div class="form-group">
                <label>Address *</label>

                <textarea name="address"
                          placeholder="Enter your complete address">${employee.address}</textarea>

                <c:if test="${not empty errors.address}">
                    <div class="field-error">${errors.address}</div>
                </c:if>
            </div>

            <div class="form-group">
                <label>Phone Number *</label>

                <input type="tel"
                       name="phoneNumber"
                       maxlength="10"
                       pattern="[0-9]{10}"
                       placeholder="Enter 10-digit mobile number"
                       value="${employee.phoneNumber}">

                <c:if test="${not empty errors.phoneNumber}">
                    <div class="field-error">${errors.phoneNumber}</div>
                </c:if>
            </div>

            <div class="form-group">
                <label>Upload Photo (PNG only) *</label>

                <input type="file"
                       name="photo"
                       accept=".png,image/png">

                <small>Only PNG format is allowed. Maximum size: 5 MB.</small>
            </div>

            <button type="submit" class="submit-btn">
                Submit Registration
            </button>

        </form>

        <div class="footer">
            Your application will be submitted for admin approval.
        </div>

    </div>
</div>

</body>
</html>
