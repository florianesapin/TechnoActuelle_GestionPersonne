<%-- 
    Document   : gestionPersonne
    Created on : Mar 28, 2016, 11:49:46 AM
    Author     : floriane.sapin
--%>

<%@page import="Model.Personne"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="includes/plugins.html" %>
                <%-- Permet de masquer mettre à jour --%>
        <script language="Javascript">
            function masqueMAJ()
            {
                document.getElementById('maj').style.visibility='visible';
                document.getElementById('rechercher').style.visibility='visible';
                document.getElementById('creer').style.visibility='visible';
            }
        </script>
        
        <script language="Javascript">
            function masqueCreer()
            {
                document.getElementById('maj').style.visibility='visible';
                document.getElementById('rechercher').style.visibility='visible';
                document.getElementById('creer').style.visibility='hidden';
            }
        </script>
        
        <%-- Permet de renseigner les champ du formulaire afin de mettre à jour une personne --%>
        <script language="Javascript">
            function modification()
            { 
                <% if (request.getAttribute("personneAMAJ") != null) {%>
                document.getElementById('maj').style.visibility='visible';
                document.getElementById('rechercher').style.visibility='visible';
                document.getElementById('creer').style.visibility='hidden';
                <%}%>
            }
        </script>
    </head>
    
    
    <body onLoad="masqueMAJ()">
        <%@ include file="includes/menu.html" %>

        <%-- Permet de faire disparaitre les alertes après 4 secondes--%>
        <script>
            window.setTimeout(function () {
                $(".alert_disparition").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 4000);
        </script>


        


        <%-- Les différentes alertes affichées --%>
        <% if ((String) request.getAttribute("result") == "ajout_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Success! </strong>La personne à été créée avec succès
        </div> <%
            }%>

        <% if ((String) request.getAttribute("result") == "suppr_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Success! </strong>La personne à été supprimée avec succès
        </div> <%
            }%>
            
        <% if ((String) request.getAttribute("result") == "suppr_fail") {%>
        <div class="alert_disparition alert alert alert-danger" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Success! </strong>La personne à été supprimée avec succès
        </div> <%
            }%>
            
        <% if ((String) request.getAttribute("result") == "maj_suc") {%>
        <div class="alert_disparition alert alert-success" id="popup" role="alert">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>Success! </strong>La personne à été mise à jour avec succèss.
        </div> <%
            }%>

        <% if (request.getAttribute("personneASupprimer") != null) {
                Personne p = (Personne) request.getAttribute("personneASupprimer");%>
        <div class="alert alert-warning" id="popup" role="alert">

            <strong>Warning! </strong> <p>Voulez-vous vraiment supprimer la personne <%out.println(p.getNom());%> <%out.println(p.getPrenom());%></p>
            <a href='ServletFaireEffacementPersonne?id=<%out.println(p.getId());%>'>Oui</a>
            <a href=''>Non</a>
        </div> <%
            }%>
            
            
        <% Personne personneAModifier = null;%>
        <% if (request.getAttribute("personneAMAJ") != null) {
                personneAModifier = (Personne) request.getAttribute("personneAMAJ");
            }
            else{
                personneAModifier = new Personne();
            }%>


        <div class="panel panel-default">
            <!--<div class="panel-heading"><p> Personne</p></div>-->
            <div class="panel-body">
                <h1> Personne </h1>             

                <form method="POST" action="ServletListePersonne">
                    
                    <input class="form-control" type="hidden" id="inputId" name="id" value =<%if(personneAModifier.getId() != null){out.println(personneAModifier.getId());}%>>
                    <div class="form-group">
                        <label for="inputNom" class="col-md-1 control-label"><p>Nom</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputNom" name="nom" value ="<%if(personneAModifier.getId() != null){out.println(personneAModifier.getNom());}%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <label for="inputPrenom" class="col-md-1 control-label"><p>Prénom</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputPrenom" name="prenom" value ="<%if(personneAModifier.getId() != null){out.println(personneAModifier.getPrenom());}%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <label for="inputAdresse" class="col-md-1 control-label"><p>Adresse</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputAdresse" name="adresse" value ="<%if(personneAModifier.getId() != null){out.println(personneAModifier.getAdresse());}%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <label for="inputVille" class="col-md-1 control-label"><p>Ville</p></label>
                        <div class="col-md-4">
                            <input class="form-control" id="inputVille" name="ville" value ="<%if(personneAModifier.getId() != null){out.println(personneAModifier.getVille());}%>">
                        </div>
                    </div>
                    <br></br>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default" id="rechercher" onclick="this.form.action = 'ServletListePersonne'">Rechercher</button>
                            <button type="submit" class="btn btn-default" id="creer" onclick="this.form.action = 'ServletCreationPersonne'">Créer</button>
                            <button type="submit" class="btn btn-default" id="maj" onclick="this.form.action = 'ServletFaireMAJPersonne'">Mettre à jour</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading"><h1> Liste des personnes </h1></div>
            <div class="panel-body">

                <table class="table table-striped">
                    <tr>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Ville</th>
                        <th>Adresse</th>
                        <th>Modifier</th>
                        <th>Supprimer</th>
                    </tr>
                    

                    <% if (request.getAttribute("personnes") != null) {
                            Vector<Personne> personnes = (Vector<Personne>) request.getAttribute("personnes");
                            for (int i = 0; i < personnes.size(); i++) {
                                Personne p = personnes.elementAt(i);
                               
                                out.println("<tr><td>" + p.getNom() + "</td><td>" + p.getPrenom() + "</td><td>" + p.getAdresse() + "</td><td>" + p.getVille() + "</td><td><form method=\"POST\" action=\"ServletMAJPersonne\"><input type=\"hidden\" id=\"inputId\" name=\"id\" value=\"" + p.getId() + "\"><button type=\"submit\" class=\"btn btn-default\" id=\"edition\" onClick=\"modification()\">Edition</button></form></td><td><form method=\"POST\" action=\"ServletEffacerPersonne\"><input type=\"hidden\" id=\"inputId\" name=\"id\" value=\"" + p.getId() + "\"><button type=\"submit\" class=\"btn btn-default\" id=\"supprimer\" onClick=\"modification()\">Supprimer</button></form></td></tr>");
                            }
                        }%>
                    </form>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                </table>
            </div>
        </div>

        <a href='index.jsp'>index</a>
    </body>
</html>
