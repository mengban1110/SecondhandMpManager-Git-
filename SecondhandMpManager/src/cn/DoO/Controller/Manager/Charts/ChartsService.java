package cn.DoO.Controller.Manager.Charts;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Charts数据 service接口
 * 
 * 接口返回值自行修改!!!
 * 
 * @author 梦伴
 *
 */
public interface ChartsService {

	/**
	 * 前台注册用户数量
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Map<String, Object> queryAccountCount() throws ClassNotFoundException, SQLException;

	/**
	 * 脏机拦截数量
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Map<String, Object> queryMissPhoneCount() throws ClassNotFoundException, SQLException;

	/**
	 * 在售商品数量
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Map<String, Object> queryInfoCount() throws ClassNotFoundException, SQLException;

	/**
	 * 交易订单总数
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Map<String, Object> queryDealCount() throws ClassNotFoundException, SQLException;

	/**
	 * 交易总额
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Map<String, Object> queryDealMoneyCount() throws ClassNotFoundException, SQLException;

	/**
	 * charts数组数据 : 手机各品牌数量
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> queryPhoneBrandData() throws ClassNotFoundException, SQLException;

	/**
	 * charts数组数据 : 手机销售前三
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> queryPhoneSalesRank() throws ClassNotFoundException, SQLException;

}
