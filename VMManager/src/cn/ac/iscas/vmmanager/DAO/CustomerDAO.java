package cn.ac.iscas.vmmanager.DAO;

import java.util.*;

import cn.ac.iscas.vmmanager.ORM.*;

import org.hibernate.transaction.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;
import org.hibernate.Query;

public class CustomerDAO {
	
	public static Session getSession(){
		return HibernateSessionFactory.getSession();
	}
	
	public void save(Customer transientInstance){
		try{
			Transaction tx = getSession().beginTransaction();
			getSession().save(transientInstance);
			tx.commit();
			getSession().close();
		}catch (RuntimeException rx){
			rx.printStackTrace();
		}
	}
	
	public List findByProperty(String property,Object value){
		try{
			String queryString = "from Customer as Customer where Customer."+property+"= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	public List findAll(){
		try{
			String queryString = "from Customer";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	public void deleteById(int id){
		try{
			Customer cus = (Customer)getSession().get(Customer.class, id);
			Transaction tx = getSession().beginTransaction();
			getSession().delete(cus);
			tx.commit();
			getSession().close();
		}catch (RuntimeException re){
			re.printStackTrace();
		}
	}
	
	
	
}
