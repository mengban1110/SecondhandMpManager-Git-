package cn.DoO.Controller.Manager.Charts.JsonPojo;

import java.util.List;
import java.util.Map;

/**
 * Json封装消息类
 * 
 * @author 梦伴
 *
 */
public class Message {

	public String msg;// 消息
	public int code;// 代码

	public int accountCount;// 前台注册用户数量
	public int missPhoneCount;// 脏机拦截数量
	public int infoCount;// 在售商品数量
	public int dealCount;// 交易订单总数
	public int dealMoneyCount;// 交易总额

	public List<Map<String, Object>> phoneBrandData;// charts数组数据 : 手机各品牌数量
	public List<Map<String, Object>> phoneSalesRank;// charts数组数据 : 手机销售前三

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getAccountCount() {
		return accountCount;
	}

	public void setAccountCount(int accountCount) {
		this.accountCount = accountCount;
	}

	public int getMissPhoneCount() {
		return missPhoneCount;
	}

	public void setMissPhoneCount(int missPhoneCount) {
		this.missPhoneCount = missPhoneCount;
	}

	public int getInfoCount() {
		return infoCount;
	}

	public void setInfoCount(int infoCount) {
		this.infoCount = infoCount;
	}

	public int getDealCount() {
		return dealCount;
	}

	public void setDealCount(int dealCount) {
		this.dealCount = dealCount;
	}

	public int getDealMoneyCount() {
		return dealMoneyCount;
	}

	public void setDealMoneyCount(int dealMoneyCount) {
		this.dealMoneyCount = dealMoneyCount;
	}

	public List<Map<String, Object>> getPhoneBrandData() {
		return phoneBrandData;
	}

	public void setPhoneBrandData(List<Map<String, Object>> phoneBrandData) {
		this.phoneBrandData = phoneBrandData;
	}

	public List<Map<String, Object>> getPhoneSalesRank() {
		return phoneSalesRank;
	}

	public void setPhoneSalesRank(List<Map<String, Object>> phoneSalesRank) {
		this.phoneSalesRank = phoneSalesRank;
	}

}
