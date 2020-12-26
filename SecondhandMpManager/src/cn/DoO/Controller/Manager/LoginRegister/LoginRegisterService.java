package cn.DoO.Controller.Manager.LoginRegister;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

/**
 * 登录或注册 service接口
 * 
 * @author 梦伴
 *
 */
public interface LoginRegisterService {

	/**
	 * 登录
	 * 
	 * @param username
	 * @param password
	 * @return 以 Map<String, Object> 返回 Manager表中的用户信息
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Map<String, Object> login(String username, String password) throws ClassNotFoundException, SQLException;

	/**
	 * 注册
	 * 
	 * @param username
	 * @param password
	 * @param email
	 * @param code
	 * @return 1注册成功 2注册失败
	 * @throws IOException
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws ClassNotFoundException
	 */
	public int register(String username, String password, String email, String code)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;

	/**
	 * 激活
	 * 
	 * @param username
	 * @param password
	 * @param email
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Map<String, Object> activity(String code) throws ClassNotFoundException, SQLException;

	/**
	 * 验证用户输入的邮箱是否存在于数据库当中
	 * 
	 * @param email
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Map<String, Object> queryByEamil(String email) throws ClassNotFoundException, SQLException;

	/**
	 * 账号密码校验成功后 通过manager_username查询此manager用户所有信息
	 * 
	 * @param email
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Map<String, Object> queryByname(String username) throws ClassNotFoundException, SQLException;

	/**
	 * 将用户昵称写入到数据库
	 * 
	 * @param nicheng
	 * @param code
	 * @throws IOException
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws ClassNotFoundException
	 */
	public void saveManagername(String nickname, String code)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;

}
