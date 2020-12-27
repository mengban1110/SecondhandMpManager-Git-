package cn.DoO.Controller.Manager.Mpinfo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 商品数据 service接口
 * @author 梦伴
 *
 */
public interface MpinfoService {
	
	/**
	 * 查询全部
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Map<String, Object>> queryAll() throws ClassNotFoundException, SQLException;

	/**
	 * 删除选中
	 * @param delArr
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 * @throws SQLException
	 * @throws IOException
	 */
	public void delArr(String[] delArr) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;


}
