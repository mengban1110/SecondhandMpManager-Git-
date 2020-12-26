package cn.hbsi.info;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import cn.hbsi.dao.Dao;
import cn.hbsi.dao.DaoImpl;

public class infoServiceImpl implements IinfoService {

	Dao dao = new DaoImpl();
	
	@Override
	public List<Map<String, Object>> queryAll() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from info";
		return dao.executeQueryForList(sql);
	}

	@Override
	public void save(String saveName,String time) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql = "insert into info values(0,?,?)";
		int[] types= {Types.VARCHAR,Types.VARCHAR};
		Object[] values= {saveName,time};
		dao.executeUpdate(sql, types, values);
	}

	@Override
	public void del(String[] checkBoxArr) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		for (String id : checkBoxArr) {
			String sql = "delete from info where id = ?";
			int[] types= {Types.INTEGER};
			Object[] values= {Integer.parseInt(id)};
			dao.executeUpdate(sql, types, values);
		}
	}

	@Override
	public Map<String, Object> login(String username, String password) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql = "select * from account where username = ? and password = ?";
		int[] types= {Types.VARCHAR,Types.VARCHAR};
		Object[] values= {username,password};
		Map<String, Object> result = dao.executeQueryForMap(sql, types, values);
		return result;
	}

}
