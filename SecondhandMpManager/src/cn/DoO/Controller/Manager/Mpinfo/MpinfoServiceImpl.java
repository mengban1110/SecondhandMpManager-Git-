package cn.DoO.Controller.Manager.Mpinfo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import cn.DoO.Dao.Dao;
import cn.DoO.Dao.DaoImpl;

/**
 * 商品数据 service接口实现类
 * 
 * @author 梦伴
 *
 */
public class MpinfoServiceImpl implements MpinfoService {

	//dao对象
	Dao dao = new DaoImpl();
	
	/**
	 * 查询全部
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	@Override
	public List<Map<String, Object>> queryAll() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT MpInfo_id,MpInfo_title,MpInfo_brand,brand_name,MpInfo_version,ram_name,color_name,condition_name,MpInfo_price,MpInfo_buyTime,MpInfo_MIME,infostatus_name,MpInfo_photo FROM mpinfo LEFT JOIN brand ON brand_id = MpInfo_brand LEFT JOIN ram ON ram_id = MpInfo_ram LEFT JOIN color ON color_id = MpInfo_color LEFT JOIN `condition` ON condition_id = MpInfo_condition LEFT JOIN infostatus ON infostatus_id = MpInfo_status";
		return dao.executeQueryForList(sql);
	}

	/**
	 * 删除选中
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	@Override
	public void delArr(String[] delArr) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		for (String del : delArr) {
			/**
			 * 级联删除 : 如果删除的mpinfo信息中 是已经出售的商品 应该先删除 出售记录表中的数据 在进行删除mpinfo中的数据
			 */
			String querySql = "select * from mpinfo where MpInfo_id=" +del; 
			Map<String, Object> map = dao.executeQueryForMap(querySql);
			String status = String.valueOf(map.get("MpInfo_status"));
			if ("2".equals(status)) {
				String delSql = "delete from buyhistory where buyhistory_mpinfoid="+del;
				dao.executeUpdate(delSql);
			}
			
			String sql = "DELETE FROM mpinfo where MpInfo_id=?";
			int[] type = {Types.INTEGER};
			Object[] values = {Integer.parseInt(del)};
			dao.executeUpdate(sql, type, values);
		}
		
	}

}
