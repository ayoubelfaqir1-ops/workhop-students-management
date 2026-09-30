package ma.youcode.ecole.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ma.youcode.ecole.models.Apprenant;

@WebServlet("/apprenants/*")
public class ApprenantsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (Apprenant.apprenants.isEmpty()) {
            Apprenant.apprenants.add(new Apprenant(1, "Youssef", "Java"));
            Apprenant.apprenants.add(new Apprenant(2, "Ahmed", "Java"));
            Apprenant.apprenants.add(new Apprenant(3, "Fatima", "JavaScript"));
            Apprenant.apprenants.add(new Apprenant(4, "Khadija", "JavaScript"));
            Apprenant.apprenants.add(new Apprenant(5, "Mohamed", "Dev AI"));
        }
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            String specialite = req.getParameter("specialite");
            if (specialite != null && !specialite.trim().isEmpty()) {
                String cleanSpecialite = specialite.trim().toLowerCase();
                List<Apprenant> apprenantsFiltre = Apprenant.apprenants.stream().filter(apr -> apr.getSpecialite().equalsIgnoreCase(cleanSpecialite)).toList();
                req.setAttribute("apprenants", apprenantsFiltre);
            }else {
                req.setAttribute("apprenants", Apprenant.apprenants);
            }
        }else if (path != null) {
            String[] parts = path.split("/",-1);
            if (parts.length == 2) {
                try {
                    int id = Integer.parseInt(parts[1]);
                    List<Apprenant> foundedApprenant = Apprenant.apprenants.stream().filter(ap -> ap.getId() == id).toList();
                    req.setAttribute("apprenantDetails", foundedApprenant);
                } catch (NumberFormatException e) {
                    req.setAttribute("Error", "ID have invalid Format");
                    req.setAttribute("apprenants", Apprenant.apprenants);
                }
            }else {
                req.setAttribute("Error", "path Invalide");
            }
        }
        req.getRequestDispatcher("/WEB-INF/views/apprenants/apprenants.jsp").forward(req, resp);        
    }

}
