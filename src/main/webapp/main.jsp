<%-- 
    Document   : main
    Created on : 10/10/2021, 05:38:49 PM
    Author     : Gerson Porras
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <script type="text/javascript">
            window.location="dashboard.jsp?Id="+ localStorage.getItem("IdUser_PK");
        </script>
    </body>
</html>
