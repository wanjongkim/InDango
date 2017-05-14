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
        <jsp:useBean id="aml" class="models.AllMovieList" scope="request" />
        <div class="container extra-space-top">
            <h3>Filter by Movie Genres</h3>
            <div class="row">
                <a class="btn btn-default" href="allMovies?page=1&genreFilter=comedy">COMEDY</a>
                <a class="btn btn-default" href="allMovies?page=1&genreFilter=action">ACTION</a>
                <a class="btn btn-default" href="allMovies?page=1&genreFilter=horror">HORROR</a>
                <a class="btn btn-default" href="allMovies?page=1&genreFilter=documentary">DOCUMENTARY</a>
                <a class="btn btn-default" href="allMovies?page=1&genreFilter=animation">ANIMATION</a>
                <a class="btn btn-default" href="allMovies?page=1&genreFilter=mystery">MYSTERY</a>
            </div>
            <hr>
            <div class="row">
                <div class="pull-left">
                    <h3>All Movies</h3>
                </div>
                <div class="pull-right btn-group">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Page ${aml.currentPage} 
                        <span class="caret"></span>
                    </button>
                    <c:if test="${aml.genre == 'all'}">
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach var="i" begin="1" end="${aml.pageLimit}" varStatus="loop">
                                <li>
                                    <a href="allMovies?page=${loop.index}">Page <c:out value = "${i}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${aml.genre == 'comedy'}">
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach var="i" begin="1" end="${aml.pageLimit}" varStatus="loop">
                                <li>
                                    <a href="allMovies?page=${loop.index}&genreFilter=comedy">Page <c:out value = "${i}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${aml.genre == 'action'}">
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach var="i" begin="1" end="${aml.pageLimit}" varStatus="loop">
                                <li>
                                    <a href="allMovies?page=${loop.index}&genreFilter=action">Page <c:out value = "${i}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${aml.genre == 'horror'}">
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach var="i" begin="1" end="${aml.pageLimit}" varStatus="loop">
                                <li>
                                    <a href="allMovies?page=${loop.index}&genreFilter=horror">Page <c:out value = "${i}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${aml.genre == 'documentary'}">
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach var="i" begin="1" end="${aml.pageLimit}" varStatus="loop">
                                <li>
                                    <a href="allMovies?page=${loop.index}&genreFilter=documentary">Page <c:out value = "${i}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${aml.genre == 'animation'}">
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach var="i" begin="1" end="${aml.pageLimit}" varStatus="loop">
                                <li>
                                    <a href="allMovies?page=${loop.index}&genreFilter=animation">Page <c:out value = "${i}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${aml.genre == 'mystery'}">
                        <ul class="dropdown-menu scrollable-menu" role="menu">
                            <c:forEach var="i" begin="1" end="${aml.pageLimit}" varStatus="loop">
                                <li>
                                    <a href="allMovies?page=${loop.index}&genreFilter=mystery">Page <c:out value = "${i}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="1" end="6" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <a href="something">
                                <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225">
                            </a>
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <a href="something">
                                <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225">
                            </a>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="1" end="6" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="7" end="12" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="7" end="12" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="13" end="18" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="13" end="18" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="19" end="24" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="19" end="24" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="25" end="30" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="25" end="30" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="31" end="36" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="31" end="36" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="37" end="42" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="37" end="42" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="43" end="48" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="43" end="48" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="49" end="54" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="49" end="54" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="55" end="60" items="${aml.l}">
                    <div class="col-sm-2">
                        <c:if test="${movie.posterPath == 'none'}">
                            <img class="img-fluid" src="http://i.imgur.com/s0QzMrl.jpg" width="175" height="225" />
                        </c:if>
                        <c:if test="${movie.posterPath != 'none'}">
                            <img class="img-fluid" src="https://image.tmdb.org/t/p/w500${movie.posterPath}" width="175" height="225" />
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="movie" begin="55" end="60" items="${aml.l}">
                    <div class="col-sm-2">
                        <h5>${movie.title}</h5>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
