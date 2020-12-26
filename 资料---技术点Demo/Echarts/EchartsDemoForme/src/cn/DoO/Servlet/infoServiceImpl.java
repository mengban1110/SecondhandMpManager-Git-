package cn.DoO.Servlet;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cn.DoO.Dao.Dao;
import cn.DoO.Dao.DaoImpl;

public class infoServiceImpl implements IinfoService {

	Dao dao=new DaoImpl();

	@Override
	public List<Map<String, Object>> queryShouRu() throws ClassNotFoundException, SQLException {
		String sql="SELECT  QUARTER(riqi) jidu,SUM(shouRuJinEr) jiner  FROM   shouru  GROUP BY  QUARTER(riqi) ";
		return dao.executeQueryForList(sql);
	}

	@Override
	public List<Map<String, Object>> queryZhiChu() throws ClassNotFoundException, SQLException {
		String sql="SELECT  QUARTER(riqi) jidu,SUM(zhiChuJinEr) jiner  FROM   ZhiChu  GROUP BY  QUARTER(riqi) ";
		return dao.executeQueryForList(sql);
	}

	@Override
	public List<Map<String, Object>> queryYuSuan() throws ClassNotFoundException, SQLException {
		String sql="SELECT  QUARTER(riqi) jidu,SUM(yuSuanJinEr) jiner  FROM   yusuan  GROUP BY  QUARTER(riqi) ";
		return dao.executeQueryForList(sql);
	}

	@Override
	public List<Map<String, Object>> queryXueLi() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select count(*) renshu ,xueli from yuangongxinxi  GROUP BY xueli ");
	}

	@Override
	public List<Map<String, Object>> queryZhe() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(" select * from zuoye  ");
	}

}
