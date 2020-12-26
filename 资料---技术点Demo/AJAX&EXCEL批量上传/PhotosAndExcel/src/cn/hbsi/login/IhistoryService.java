package cn.hbsi.login;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IhistoryService {
	public int add(String id,String visit,String bevisit,String nowTime) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	public List<Map<String, Object>> queryAll() throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	public void del(String[] checkBoxArr) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	public void update(String id, String visit, String bevisit, String nowTime) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	public Map<String, Object> queryOne(String id) throws ClassNotFoundException, SQLException;
	public List<Map<String, Object>> query_ss(String visit) throws ClassNotFoundException, SQLException;
}
