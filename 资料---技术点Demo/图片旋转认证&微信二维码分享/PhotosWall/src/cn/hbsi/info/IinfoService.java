package cn.hbsi.info;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cn.hbsi.dao.DaoImpl;

public interface IinfoService {
	public List<Map<String, Object>> queryAll() throws ClassNotFoundException, SQLException;
	public void save(String saveName,String time) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	public void del(String[] checkBoxArr) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	public Map<String, Object> login(String username, String password) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
}
