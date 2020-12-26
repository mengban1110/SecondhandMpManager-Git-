package cn.DoO.Controller.Manager.LoginRegister;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;

import cn.DoO.Dao.Dao;
import cn.DoO.Dao.DaoImpl;

/**
 * 登录或注册 service接口实现类
 * 
 * @author 梦伴
 *
 */
public class LoginRegisterServiceImpl implements LoginRegisterService {

	// dao 对象
	Dao dao = new DaoImpl();

	/**
	 * 登录
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public Map<String, Object> login(String username, String password) throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM manager WHERE manager_username=? AND manager_password=?";

		int[] types = new int[2];
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;

		Object[] values = new Object[2];
		values[0] = username;
		values[1] = password;

		return dao.executeQueryForMap(sql, types, values);
	}

	/**
	 * 注册
	 * 
	 * @throws IOException
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws ClassNotFoundException
	 */
	@Override
	public int register(String username, String password, String email, String code)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql = "  insert into manager(manager_id,manager_nickname,manager_username,manager_password,manager_email,manager_status,manager_code)  values(?,?,?,?,?,?,?)    ";

		int[] types = new int[7];
		types[0] = Types.INTEGER;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		types[3] = Types.VARCHAR;
		types[4] = Types.VARCHAR;
		types[5] = Types.INTEGER;
		types[6] = Types.VARCHAR;

		Object[] values = new Object[7];
		values[0] = 0;
		values[1] = "默认";
		values[2] = username;
		values[3] = password;
		values[4] = email;
		values[5] = 2;
		values[6] = code;

		return dao.executeUpdate(sql, types, values);
	}

	/**
	 * 激活
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	@Override
	public Map<String, Object> activity(String code) throws ClassNotFoundException, SQLException {
		return dao.executeQueryForMap(" SELECT * FROM manager WHERE manager_code=?",
				new int[] { Types.VARCHAR }, new Object[] { code });

	}

	/**
	 * 验证用户输入的邮箱是否存在于数据库当中
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * 
	 */
	@Override
	public Map<String, Object> queryByEamil(String email) throws ClassNotFoundException, SQLException {
		String sql = " SELECT * FROM manager WHERE manager_email=?";

		int[] types = new int[1];
		types[0] = Types.VARCHAR;

		Object[] values = new Object[1];
		values[0] = email;

		return dao.executeQueryForMap(sql, types, values);
	}

	/**
	 * 将用户昵称写入到数据库
	 * 
	 * @throws IOException
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws ClassNotFoundException
	 * 
	 */
	@Override
	public void saveManagername(String nickname, String code)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		dao.executeUpdate("  update manager  set manager_nickname=?,manager_status = 1 where manager_code=? ",
				new int[] { Types.VARCHAR, Types.VARCHAR }, new Object[] { nickname, code });
	}

	/**
	 * 通过manager_username查询此manager用户所有信息
	 */
	@Override
	public Map<String, Object> queryByname(String username) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql = " SELECT * FROM manager WHERE manager_username=? ";

		int[] types = new int[1];
		types[0] = Types.VARCHAR;

		Object[] values = new Object[1];
		values[0] = username;

		return dao.executeQueryForMap(sql, types, values);
	}

}
