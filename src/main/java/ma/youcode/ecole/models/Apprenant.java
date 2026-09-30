package ma.youcode.ecole.models;

import java.util.ArrayList;
import java.util.List;

public class Apprenant {

    // In-memory mock database shared across all requests
    public static List<Apprenant> apprenants = new ArrayList<>();

    private int id;
    private String nom;
    private String specialite;

    public Apprenant() {
    }

    public Apprenant(int id, String nom, String specialite) {
        this.id = id;
        this.nom = nom;
        this.specialite = specialite;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSpecialite() {
        return specialite;
    }

    public void setSpecialite(String specialite) {
        this.specialite = specialite;
    }

    @Override
    public String toString() {
        return "Apprenant{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", specialite='" + specialite + '\'' +
                '}';
    }
}
