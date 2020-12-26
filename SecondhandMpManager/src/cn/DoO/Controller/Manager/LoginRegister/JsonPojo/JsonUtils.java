package cn.DoO.Controller.Manager.LoginRegister.JsonPojo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.DoO.Controller.Manager.LoginRegister.JsonPojo.Message;

/**
 * json转换工具类
 * 
 * @author 梦伴
 *
 */
public class JsonUtils {
	/**
	 * 对象转换json
	 * 
	 * @param obj
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static String jsonOut(Object obj) throws JsonGenerationException, JsonMappingException, IOException {
		// 初始化Jackson包中解析json的核心类
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(obj);
		return json;
	}

	/**
	 * 将json结果写入respon并返回 LoginRegister
	 * 
	 * @param response
	 * @param message
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static void writeJson(HttpServletResponse response, Message message)
			throws JsonGenerationException, JsonMappingException, IOException {
		// 处理json
		String json = JsonUtils.jsonOut(message);
		System.out.println(json);

		// response写入json
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
		out.close();
	}

}
