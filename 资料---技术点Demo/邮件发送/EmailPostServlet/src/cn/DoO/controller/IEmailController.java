package cn.DoO.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

public interface IEmailController {
	
	/**
	 * 注册
	 * @param username
	 * @param password
	 * @param email
	 * @param code
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void register(String username,String password,String email,String code) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	
	/**
	 * 查询验证码
	 * @param ucode
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Map<String, Object> queryCode(String ucode) throws ClassNotFoundException, SQLException;

	/**
	 * 更新状态
	 * @param ucode
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	public void updateUstate(String ucode) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
}
