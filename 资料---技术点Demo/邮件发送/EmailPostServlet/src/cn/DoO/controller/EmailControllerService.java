package cn.DoO.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;
import java.util.UUID;

import cn.DoO.Dao.Dao;
import cn.DoO.Dao.DaoImpl;

public class EmailControllerService implements IEmailController {

	Dao dao = new DaoImpl();
	
	@Override
	public void register(String username, String password, String email, String code) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql = "insert into user(id,username,password,email,ustate,ucode) values(?,?,?,?,?,?)";
		
		int[] types = new int[6];
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		types[3] = Types.VARCHAR;
		types[4] = Types.INTEGER;
		types[5] = Types.VARCHAR;
		
		Object[] values = new Object[6];
		values[0] = UUID.randomUUID().toString();
		values[1] = username;
		values[2] = password;
		values[3] = email;
		values[4] = 1;
		values[5] = code;
		
		dao.executeUpdate(sql, types, values);
	}

	@Override
	public Map<String, Object> queryCode(String ucode) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where ucode = ?";
		int[] types = {Types.VARCHAR};
		Object[] values = {ucode};
		return dao.executeQueryForMap(sql, types, values);
	}

	@Override
	public void updateUstate(String ucode) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql = "update user set ustate = 2 where ucode = ?";
		
		int[] types = {Types.VARCHAR};
		Object[] values = {ucode};
		dao.executeUpdate(sql, types, values);
	}

}
