package cn.ac.iscas.vmmanager.DAO;

import cn.ac.iscas.vmmanager.ORM.*;

import java.util.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class InstanceDAO {
	public static Session getSession() {
		return HibernateSessionFactory.getSession();
	}

	public void save(Instance transientInstance) {
		try {
			Session session = getSession();
			Transaction tx = session.beginTransaction();
			session.save(transientInstance);
			tx.commit();
			session.clear();
		} catch (RuntimeException rx) {
			rx.printStackTrace();
		}
	}

	public List findByProperty(String property, Object value) {
		try {
			Session session = getSession();
			String queryString = "from Instance as Instance where Instance."
					+ property + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			session.clear();
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findAll() {
		try {
			Session session = getSession();
			String queryString = "from Instance";
			Query queryObject = session.createQuery(queryString);
			session.clear();
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void deleteById(int id) {
		try {
			Session session = getSession();
			Instance ad = (Instance) session.get(Instance.class, id);
			Transaction tx = session.beginTransaction();
			session.delete(ad);
			tx.commit();
			session.clear();
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
	}

	public List JoinFind() {
		try {
			Session session = getSession();
			String queryString = "select c.companyId,c.companyName,ins.id,ins.hostSize,ins.hostOs,ins.payMethod,ins.timeUsed,ins.instanceIp,ins.instanceState";
			queryString += " from Customer c,Instance ins where c.companyId=ins.customer.companyId";
			Query queryObject = session.createQuery(queryString);
			session.clear();
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public void updateByid(int id,String update){
		try {
			Session session = getSession();
			Instance ad = (Instance) session.get(Instance.class, id);
			ad.setInstanceState(update);
			Transaction tx = session.beginTransaction();
			session.update(ad);
			tx.commit();
			session.clear();
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
	}
	
	public void updateip(int id,String update){
		try {
			Session session = getSession();
			Instance ad = (Instance) session.get(Instance.class, id);
			ad.setInstanceIp(update);
			Transaction tx = session.beginTransaction();
			session.update(ad);
			tx.commit();
			session.clear();
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
	}
	
	public void updateid(int id,String update){
		try {
			Session session = getSession();
			Instance ad = (Instance) session.get(Instance.class, id);
			ad.setInstanceId(update);
			Transaction tx = session.beginTransaction();
			session.update(ad);
			tx.commit();
			session.clear();
		} catch (RuntimeException re) {
			re.printStackTrace();
		}
	}
}










