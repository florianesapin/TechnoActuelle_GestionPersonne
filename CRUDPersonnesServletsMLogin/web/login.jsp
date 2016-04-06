<%-- 
    Document   : login
    Created on : 6 janv. 2010, 14:19:14
    Author     : termine
--%>

<%@ include file="includes/plugins.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page - gestion des personnes (CRUD) </title>
    </head>
    <body> 
        <div class="jumbotron">
            <div class="panel panel-info">
                <div class="panel-heading"><h3>Connexion - Gestion personne</h3></div>
                <div class="panel-body">

                    <form method="POST" action="ServletLogin">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                            <input class="form-control input-lg" type="text" placeholder="Nom d'utilisateur" name="username">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                            <input class="form-control input-lg" type="password" placeholder="Mot de passe" name="password">
                        </div>
                        
                        <span class="glyphicon glyphicon-connect" aria-hidden="true"></span>
                        <br>
                        <button type="submit" value="login" class="btn btn-success btn-lg btn-block"><bold>Connexion</bold></button>
                                               
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
