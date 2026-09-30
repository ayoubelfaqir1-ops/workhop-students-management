<%@ page import="java.util.List" %>
<%@ page import="ma.youcode.ecole.models.Apprenant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Apprenants - YouCode</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f6f9;
        }
        h2 {
            color: #333;
        }
        .error-box {
            padding: 12px 16px;
            margin-bottom: 20px;
            background-color: #f8d7da;
            color: #842029;
            border: 1px solid #f5c2c7;
            border-radius: 6px;
            max-width: 700px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 700px;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 6px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        th {
            background-color: #0d6efd;
            color: white;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f1f5f9;
        }
        .back-link {
            display: inline-block;
            margin-top: 10px;
            color: #0d6efd;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <%-- 1. Affichage des Erreurs s'il y en a --%>
    <% 
        String error = (String) request.getAttribute("Error");
        if (error != null) { 
    %>
        <div class="error-box">
            <strong>Attention :</strong> <%= error %>
        </div>
    <% } %>

    <%-- 2. Affichage des Détails d'un seul apprenant (/apprenants/{id}) --%>
    <% 
        List<Apprenant> details = (List<Apprenant>) request.getAttribute("apprenantDetails");
        if (details != null) {
            if (!details.isEmpty()) {
                Apprenant a = details.get(0);
    %>
        <h2>Détails de l'Apprenant</h2>
        <table>
            <tr>
                <th style="width: 30%;">ID</th>
                <td><%= a.getId() %></td>
            </tr>
            <tr>
                <th>Nom</th>
                <td><%= a.getNom() %></td>
            </tr>
            <tr>
                <th>Spécialité</th>
                <td><%= a.getSpecialite() %></td>
            </tr>
        </table>
    <%      } else { %>
        <h2>Détails de l'Apprenant</h2>
        <p>Aucun apprenant trouvé avec cet identifiant.</p>
    <%      } %>
        <a class="back-link" href="<%= request.getContextPath() %>/apprenants">← Retour à la liste complète</a>

    <%-- 3. Affichage de la Liste Globale ou Filtrée (/apprenants ou /apprenants?specialite=...) --%>
    <% 
        } else {
            List<Apprenant> list = (List<Apprenant>) request.getAttribute("apprenants");
    %>
        <h2>Liste des Apprenants</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Spécialité</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (list != null && !list.isEmpty()) {
                        for (Apprenant a : list) { 
                %>
                    <tr>
                        <td><%= a.getId() %></td>
                        <td><%= a.getNom() %></td>
                        <td><%= a.getSpecialite() %></td>
                    </tr>
                <% 
                        } 
                    } else { 
                %>
                    <tr>
                        <td colspan="3" style="text-align: center; color: #777;">Aucun apprenant trouvé.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>

</body>
</html>
