package cn.DoO.Controller.Manager.Charts;

import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.sun.java.swing.plaf.windows.resources.windows;

import cn.DoO.Dao.Dao;
import cn.DoO.Dao.DaoImpl;

/**
 * Charts数据 service接口实现类
 * 
 * 接口返回值自行修改!!!
 * 
 * @author 梦伴
 *
 */
public class ChartsServiceImpl implements ChartsService {

	// dao 对象
	Dao dao = new DaoImpl();

	/**
	 * 前台注册用户数量
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public Map<String, Object> queryAccountCount() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(" SELECT COUNT(*) AS 'accountCount' FROM account ");
	}

	/**
	 * 脏机拦截数量
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public Map<String, Object> queryMissPhoneCount() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(" SELECT countNum AS 'missPhoneCount' FROM losephonecount ");
	}

	/**
	 * 在售商品数量
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public Map<String, Object> queryInfoCount() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(" SELECT COUNT(*) AS 'infoCount' FROM mpinfo WHERE MpInfo_status=1 ");
	}

	/**
	 * 交易订单总数
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public Map<String, Object> queryDealCount() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(" SELECT COUNT(*) AS 'dealCount' FROM buyhistory ");
	}

	/**
	 * 交易总额
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public Map<String, Object> queryDealMoneyCount() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(
				" SELECT SUM(m.MpInfo_price) AS 'dealMoneyCount' FROM buyhistory AS b,mpinfo AS m WHERE b.buyhistory_mpinfoid=m.MpInfo_id AND m.MpInfo_status=2 ");
	}

	/**
	 * charts数组数据 : 手机各品牌数量
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public List<Map<String, Object>> queryPhoneBrandData() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(
				" SELECT b.brand_name AS 'brand',COUNT(b.brand_name) AS 'count' FROM mpinfo AS m ,brand AS b WHERE b.brand_id = m.MpInfo_brand GROUP BY b.brand_name ");
	}

	/**
	 * charts数组数据 : 手机销售前三
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public List<Map<String, Object>> queryPhoneSalesRank() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList(
				" SELECT b.brand_name AS 'brand',COUNT(b.brand_name) AS 'count' FROM mpinfo AS m ,brand AS b WHERE b.brand_id = m.MpInfo_brand GROUP BY b.brand_name ORDER BY COUNT(b.brand_name) DESC LIMIT 3 ");
	}

}
