package br.edu.ifpr.irati.ads.dao;

import jakarta.persistence.PersistenceException;
import jakarta.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.List;

public class GenericDao<T> implements Dao<T> {

    protected final Class classePersistente;
    protected Session session;

    public GenericDao(Class classePersistente, Session session) {
        this.classePersistente = classePersistente;
        this.session = session;
    }

    @Override
    public T findById(Serializable id) throws PersistenceException {
        T t = null;
        try {
            t = (T) session.find(classePersistente, id);
            return t;
        } catch (HibernateException | NullPointerException e) {
            throw new PersistenceException(e.getMessage());
        }
    }

    @Override
    public void save(T t) throws PersistenceException {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.persist(t);
            transaction.commit();
        } catch (HibernateException | NullPointerException e) {
            throw new PersistenceException(e.getMessage());
        }
    }

    @Override
    public void update(T t) throws PersistenceException {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.merge(t);
            transaction.commit();
        } catch (HibernateException | NullPointerException e) {
            throw new PersistenceException(e.getMessage());
        }
    }

    @Override
    public void delete(T t) throws PersistenceException {

        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.remove(t);
            transaction.commit();
        } catch (HibernateException | NullPointerException e) {
            throw new PersistenceException(e.getMessage());
        }

    }

    @Override
    public List<T> findAll() throws PersistenceException {

        try {
            String hql = "from " + this.classePersistente.getCanonicalName();
            Query query = session.createQuery(hql, this.classePersistente);
            List results = query.getResultList();
            return results;
        } catch (HibernateException | NullPointerException e) {
            throw new PersistenceException(e.getMessage());
        }
    }
}
