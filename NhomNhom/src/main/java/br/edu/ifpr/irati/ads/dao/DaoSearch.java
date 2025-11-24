package br.edu.ifpr.irati.ads.dao;

import br.edu.ifpr.irati.ads.model.Edible; // Importante importar o modelo
import jakarta.persistence.PersistenceException;
import jakarta.persistence.Query;
import org.hibernate.Session;

import java.util.List;

public class DaoSearch {
    protected Session session;

    public DaoSearch(Session session) {
        this.session = session;
    }

    public List<Edible> findByName(String nomeBusca) throws PersistenceException {
        try {
            String hql = "FROM edible e WHERE LOWER(e.edibleName) LIKE LOWER(:nome)";
            Query query = session.createQuery(hql, Edible.class);

            query.setParameter("nome", "%" + nomeBusca + "%");

            return query.getResultList();

        } catch (Exception e) {
            e.printStackTrace();
            throw new PersistenceException("Erro ao buscar por nome: " + e.getMessage());
        }
    }
}