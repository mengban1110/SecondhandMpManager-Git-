package cn.hbsi.login;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import cn.hbsi.dao.Dao;
import cn.hbsi.dao.DaoImpl;

public class historyServiceImpl implements IhistoryService {

	Dao dao = new DaoImpl();
	
	@Override
	public int add(String id,String visit,String bevisit,String nowTime) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql1 = "insert into visit values(?,?)";
		int[] types1= {Types.VARCHAR,Types.VARCHAR};
		Object[] values1= {id,visit};
		dao.executeUpdate(sql1, types1, values1);
		
		
		String sql2 = "insert into infomation values(0,?,(SELECT beid from bevisit WHERE bename = ?),?)";
		int[] types2 = {Types.VARCHAR,Types.VARCHAR,Types.VARCHAR};
		Object[] values2 = {id,bevisit,nowTime};
		dao.executeUpdate(sql2, types2, values2);
		
		return 1;
	}

	@Override
	public List<Map<String, Object>> queryAll()
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql = "SELECT info.id,vi.vname,be.bename,be.besex,be.bephone,info.time FROM infomation info LEFT JOIN bevisit be ON info.bevisit = be.beid LEFT JOIN visit vi on info.visit = vi.vid";
		return dao.executeQueryForList(sql);
	}

	@Override
	public void del(String[] checkBoxArr) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		for (String id : checkBoxArr) {
			String sql = "delete from infomation where id = ? ";
			int[] types= {Types.INTEGER};
			Object[] values= {Integer.parseInt(id)};
			dao.executeUpdate(sql, types, values);
		}
	}

	@Override
	public void update(String id, String visit, String bevisit, String nowTime) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql1 = "UPDATE visit SET visit.vname = ? WHERE vid = (select info.visit FROM infomation info where info.id = ?)";
		String sql2 = "UPDATE bevisit SET bevisit.bename = ? WHERE beid = (select info.bevisit FROM infomation info where info.id = ?)";
		String sql3 = "UPDATE infomation SET time = ? WHERE id = ?";
		
		int[] types = {Types.VARCHAR,Types.INTEGER};
		Object[] values = {visit,id};
		Object[] values2 = {bevisit,id};
		Object[] values3 = {nowTime,id};
		dao.executeUpdate(sql1, types, values);
		dao.executeUpdate(sql2, types, values2);
		dao.executeUpdate(sql3, types, values3);
	}

	@Override
	public Map<String, Object> queryOne(String id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT info.id,vi.vname,be.bename,info.time FROM infomation info LEFT JOIN bevisit be ON info.bevisit = be.beid LEFT JOIN visit vi on info.visit = vi.vid where id = ?";
		int[] types= {Types.INTEGER};
		Object[] values= {Integer.parseInt(id)};
		return dao.executeQueryForMap(sql, types, values);
	}

	@Override
	public List<Map<String, Object>> query_ss(String visit) throws ClassNotFoundException, SQLException {
		String sql = "SELECT info.id,vi.vname,be.bename,be.besex,be.bephone,info.time FROM infomation info LEFT JOIN bevisit be ON info.bevisit = be.beid LEFT JOIN visit vi on info.visit = vi.vid WHERE bename like '%"+visit+"%'";
		return dao.executeQueryForList(sql);
	}

}
