package cn.DoO.Controller.Manager.LoginRegister.JsonPojo;

/**
 * Json封装消息类
 * 
 * @author 梦伴
 *
 */
public class Message {

	public String msg;// 消息
	public int code;// 代码
	public String name;// 用户名

	public String getMsg() {
		return msg;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

}
