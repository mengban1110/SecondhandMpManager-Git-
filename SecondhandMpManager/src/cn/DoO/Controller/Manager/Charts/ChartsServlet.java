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
	 */
	private void queryAll(HttpServletRequest request, HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		chartsService.queryAccountCount();//前台注册用户数量
		chartsService.queryMissPhoneCount();//脏机拦截数量
		chartsService.queryInfoCount();//在售商品数量
		chartsService.queryDealCount();//交易订单总数
		chartsService.queryDealMoneyCount();//交易总额
		chartsService.queryPhoneBrandData();//charts数组数据 : 手机各品牌数量
		chartsService.queryPhoneSalesRank();//charts数组数据 : 手机销售前三
		
		Message message = new Message();
		//message.set...
		
		JsonUtils.writeJson(response, message);
	}

}
