package cn.ac.iscas.vmmanager.DAO;

import java.util.List;
import cn.ac.iscas.vmmanager.ORM.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AdminDAO {
	
	public static Session getSession(){
		return HibernateSessionFactory.getSession();
	}
	
	public void save(Admin transientInstance){
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
			String queryString = "from Admin as Admin where Admin."+property+"= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	public List findAll(){
		try{
			String queryString = "from Admin";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		}catch(RuntimeException re){
			throw re;
		}
	}
	
	public void deleteById(int id){
		try{
			Admin ad = (Admin)getSession().get(Admin.class, id);
			Transaction tx = getSession().beginTransaction();
			getSession().delete(ad);
			tx.commit();
			getSession().close();
		}catch (RuntimeException re){
			re.printStackTrace();
		}
	}
}











