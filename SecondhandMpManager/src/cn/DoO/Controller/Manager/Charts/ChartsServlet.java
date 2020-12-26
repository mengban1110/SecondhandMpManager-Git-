package cn.DoO.Controller.Manager.Charts;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

import cn.DoO.Controller.Manager.Charts.JsonPojo.JsonUtils;
import cn.DoO.Controller.Manager.Charts.JsonPojo.Message;

/**
 * Charts数据 function接口
 * 
 * @author 梦伴
 * 
 */
public class ChartsServlet extends HttpServlet {

	// service对象
	ChartsService chartsService = new ChartsServiceImpl();

	// session对象
	HttpSession session;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doPost(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");

		try {
			if ("queryAll".equals(method)) {// 查询
				this.queryAll(request, response);
			} else {
				// 3.实例化json储存对象
				Message message = new Message();

				// 4.设置json数据
				message.setMsg("请求错误");
				message.setCode(4);

				// 将json结果写入respon并返回
				JsonUtils.writeJson(response, message);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 查询所有
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void queryAll(HttpServletRequest request, HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException, ClassNotFoundException, SQLException {
		Map<String, Object> accountCount = chartsService.queryAccountCount();//前台注册用户数量
		System.out.println("注册数量"+accountCount);
		
		
		Map<String, Object> missPhoneCount = chartsService.queryMissPhoneCount();//脏机拦截数量
		System.out.println("脏机拦截数量"+missPhoneCount);
		
		Map<String, Object> infoCount = chartsService.queryInfoCount();//在售商品数量
		System.out.println("在售商品数量"+infoCount);
		
		
		Map<String, Object> dealCount = chartsService.queryDealCount();//交易订单总数
		System.out.println("交易订单总数"+dealCount);
		
		
		Map<String, Object> dealMoneyCount = chartsService.queryDealMoneyCount();//交易总额
		System.out.println("交易总额"+dealMoneyCount);
		
		
		List<Map<String, Object>> phoneBrandData = chartsService.queryPhoneBrandData();//charts数组数据 : 手机各品牌数量
		System.out.println("手机各品牌数量"+phoneBrandData);
		
		
		List<Map<String, Object>> phoneSalesRank = chartsService.queryPhoneSalesRank();//charts数组数据 : 手机销售前三
		System.out.println("手机销售前三"+phoneSalesRank);
		
		
		Message message = new Message();
		message.setMsg("获取成功");
		message.setCode(1);
		Object accountCountValue = accountCount.get("accountCount");
		message.setAccountCount(JsonUtils.objParseInt(accountCountValue));
		
		Object missPhoneCountValue = missPhoneCount.get("missPhoneCount");
		message.setMissPhoneCount(JsonUtils.objParseInt(missPhoneCountValue));
		
		Object infoCountValue = infoCount.get("infoCount");
		message.setInfoCount(JsonUtils.objParseInt(infoCountValue));
		
		Object dealCountValue = dealCount.get("dealCount");
		message.setDealCount(JsonUtils.objParseInt(dealCountValue));
		
		Object dealMoneyCountValue = dealMoneyCount.get("dealMoneyCount");
		
		message.setDealMoneyCount(Double.valueOf(String.valueOf(dealMoneyCountValue)));
		
		message.setPhoneBrandData(phoneBrandData);
		message.setPhoneSalesRank(phoneSalesRank);
		
		JsonUtils.writeJson(response, message);
	}

	
	
}
