-- Creates the Server Audit object to send data to the Windows Security Log
CREATE SERVER AUDIT [Audit_Failed_Logins_To_Security_Log]
TO SECURITY_LOG
WITH
(   QUEUE_DELAY = 1000,
    ON_FAILURE = CONTINUE
);
GO

-- Enables the Server Audit
ALTER SERVER AUDIT [Audit_Failed_Logins_To_Security_Log]
WITH (STATE = ON);
GO

-- Creates the Server Audit Specification to capture failed logins
CREATE SERVER AUDIT SPECIFICATION [ServerAuditSpecification_Failed_Logins]
FOR SERVER AUDIT [Audit_Failed_Logins_To_Security_Log]
ADD (FAILED_LOGIN_GROUP);
GO

-- Enables the Server Audit Specification
ALTER SERVER AUDIT SPECIFICATION [ServerAuditSpecification_Failed_Logins]
WITH (STATE = ON);
GO