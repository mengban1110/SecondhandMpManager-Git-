package cn.DoO.Controller.Manager.Charts;

import java.util.List;
import java.util.Map;

import cn.DoO.Dao.Dao;
import cn.DoO.Dao.DaoImpl;

/**
 * Charts数据 service接口实现类
 * 
 * 接口返回值自行修改!!!
 * 
 * @author 梦伴
 *
 */
public class ChartsServiceImpl implements ChartsService {

	// dao 对象
	Dao dao = new DaoImpl();

	/**
	 * 前台注册用户数量
	 */
	@Override
	public void queryAccountCount() {
		// TODO Auto-generated method stub

	}

	/**
	 * 脏机拦截数量
	 */
	@Override
	public void queryMissPhoneCount() {
		// TODO Auto-generated method stub

	}

	/**
	 * 在售商品数量
	 */
	@Override
	public void queryInfoCount() {
		// TODO Auto-generated method stub

	}

	/**
	 * 交易订单总数
	 */
	@Override
	public void queryDealCount() {
		// TODO Auto-generated method stub

	}

	/**
	 * 交易总额
	 */
	@Override
	public void queryDealMoneyCount() {
		// TODO Auto-generated method stub

	}

	/**
	 * charts数组数据 : 手机各品牌数量
	 */
	@Override
	public void queryPhoneBrandData() {
		// TODO Auto-generated method stub

	}

	/**
	 * charts数组数据 : 手机销售前三
	 */
	@Override
	public void queryPhoneSalesRank() {
		// TODO Auto-generated method stub

	}

}
