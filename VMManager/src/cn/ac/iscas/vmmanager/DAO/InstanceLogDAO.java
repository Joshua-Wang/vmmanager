package cn.ac.iscas.vmmanager.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cn.ac.iscas.vmmanager.ORM.Instance;

public class InstanceLogDAO {
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
			String queryString = "from InstanceLog as Instance where Instance."
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
			String queryString = "from InstanceLog";
			Query queryObject = session.createQuery(queryString);
			session.clear();
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
