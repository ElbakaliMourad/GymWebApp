package com.mygymweb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.mygymweb.dao.TrainerDAO;
import com.mygymweb.entities.Trainer;

public class TrainerService implements TrainerDAO {

	@Override
	public List<Trainer> getAllTrainers() {
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();

//	Query query = entitymanager.createQuery((query = "SELECT e FROM Trainer e", name = "queryAllTrainers"));
		Query query = entitymanager.createNamedQuery("queryAllTrainers");
		List<Trainer> trainerList = new ArrayList<Trainer>();
		trainerList = query.getResultList();

		entitymanager.close();
		entitymanagerfactory.close();

		return trainerList;
	}

}
