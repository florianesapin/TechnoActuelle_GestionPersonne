<%-- 
    Document   : gestionPersonne
    Created on : Mar 28, 2016, 11:49:46 AM
    Author     : floriane.sapin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <h1> Personne</h1>
        <form method="GET" action="ServletListePersonne">
            nom: <input type="text" name="nom"><br>
            prenom : <input type="text" name="prenom"><br>
            adresse: <input type="text" name="adresse"><br>
            ville :  <input type="text" name="ville"><br>
            <input type="submit" value="Rechercher">
            <input type="submit" value="Créer">
            <input type="submit" value="Mettre à jour">
        </form>

        <h1> Liste des personnes </h1>

        <table>
            <tr>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Ville</th>
                <th>Adresse</th>
                <th>Modifier</th>
                <th>Supprimer</th>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

        </table>


        <a href='index.jsp'>index</a>
    </body>
</html>
