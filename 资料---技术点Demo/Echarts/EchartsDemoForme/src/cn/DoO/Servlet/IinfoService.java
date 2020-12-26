package cn.DoO.Servlet;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IinfoService {
		
	List<Map<String, Object>> queryShouRu() throws ClassNotFoundException, SQLException;

	List<Map<String, Object>> queryZhiChu() throws ClassNotFoundException, SQLException;

	List<Map<String, Object>> queryYuSuan() throws ClassNotFoundException, SQLException;

	List<Map<String, Object>> queryXueLi() throws ClassNotFoundException, SQLException;

	List<Map<String, Object>> queryZhe() throws ClassNotFoundException, SQLException;

	
}
