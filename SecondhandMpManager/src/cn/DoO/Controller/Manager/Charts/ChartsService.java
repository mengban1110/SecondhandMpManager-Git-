package cn.DoO.Controller.Manager.Charts;

/**
 * Charts数据 service接口
 * 
 * 接口返回值自行修改!!!
 * 
 * @author 梦伴
 * test
 *
 */
public interface ChartsService {

	/**
	 * 前台注册用户数量
	 */
	public void queryAccountCount();

	/**
	 * 脏机拦截数量
	 */
	public void queryMissPhoneCount();

	/**
	 * 在售商品数量
	 */
	public void queryInfoCount();

	/**
	 * 交易订单总数
	 */
	public void queryDealCount();

	/**
	 * 交易总额
	 */
	public void queryDealMoneyCount();

	/**
	 * charts数组数据 : 手机各品牌数量
	 */
	public void queryPhoneBrandData();

	/**
	 * charts数组数据 : 手机销售前三
	 */
	public void queryPhoneSalesRank();

}
