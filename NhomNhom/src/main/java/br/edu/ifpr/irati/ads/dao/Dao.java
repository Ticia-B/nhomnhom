package br.edu.ifpr.irati.ads.dao;

import jakarta.persistence.PersistenceException;

import java.io.Serializable;
import java.util.List;

public interface Dao <T>{
    public T findById(Serializable id) throws PersistenceException;

    public void save(T entity) throws PersistenceException;

    public void update(T entity) throws PersistenceException;

    public void delete(T entity) throws PersistenceException;

    public List<T> findAll() throws PersistenceException;
}
