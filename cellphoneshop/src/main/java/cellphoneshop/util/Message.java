package cellphoneshop.util;

import java.util.Properties;

public class Message {
	private Properties messageList;

	public void setMessageList(Properties messageList) {
		this.messageList = messageList;
	}
	
	public Properties getMessageList() {
		return messageList;
	}
	
	public String getMessage(String name) {
		return messageList.getProperty(name);
	}
}
