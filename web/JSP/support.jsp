<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>InDango</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="resources/css/layout.css" rel="stylesheet" type="text/css">
        <link href="resources/css/colors.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Bitter:700" rel="stylesheet">
        <link href="resources/css/fonts.css" rel="stylesheet" type="text/css">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>
    <body class="blue">
        <%@include file="header.jsp" %>
        <div class="container extra-space-top">
            <div class="container" style="background-color:white;">
                <div style="text-align:center;">
                    <h2 class="fjalla">Support Request</h2>
                </div>
                <form class="form-horizontal" method="POST" action="supportRequest">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" placeholder="">
                        <small id="emailHelp" class="form-text text-muted">Please describe as most descriptive possible.</small>
                    </div>
                    <div class="form-group">
                        <div>
                            <label for="body">Body</label>
                            <textarea class="form-control" rows="12" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
