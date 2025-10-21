package br.edu.ifpr.irati.ads.dao;

import jakarta.persistence.PersistenceException;
import jakarta.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.List;

public class GenericDao <T> implements Dao<T> {
    protected final Class persistentClass;
    protected Session session;

    public GenericDao(Class persistentClass, Session session) {
        this.persistentClass = persistentClass;
        this.session = session;
    }

    @Override
    public T findById(Serializable id) throws PersistenceException {
        T entity = null;
        try {
            entity = (T) session.find(persistentClass, id);
            return entity;
        } catch(HibernateException he) {
            throw new PersistenceException(he.getMessage());
        }
    }

    @Override
    public void save(T entity) throws PersistenceException {
        Transaction transaction = null;
        try{
            transaction = session.beginTransaction();
            session.persist(entity);
            transaction.commit();
        }catch (HibernateException | NullPointerException e){
            throw new PersistenceException(e.getMessage());
        }
    }

    @Override
    public void update(T entity) throws PersistenceException {
        Transaction transaction = null;
        try{
            transaction = session.beginTransaction();
            session.merge(entity);
            transaction.commit();
        }catch (HibernateException | NullPointerException e){
            throw new PersistenceException(e.getMessage());
        }
    }

    @Override
    public void delete(T entity) throws PersistenceException {
        Transaction transaction = null;
        try{
            transaction = session.beginTransaction();
            session.remove(entity);
            transaction.commit();
        }catch (HibernateException | NullPointerException e){
            throw new PersistenceException(e.getMessage());
        }
    }

    @Override
    public List<T> findAll() throws PersistenceException {
        try{
            String hql = "from " + this.persistentClass.getCanonicalName();
            Query query = session.createQuery(hql, this.persistentClass);
            List results = query.getResultList();
            return results;
        }catch (HibernateException | NullPointerException e){
                throw new PersistenceException(e.getMessage());
            }
        }
    }
}
