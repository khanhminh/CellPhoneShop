package cellphoneshop.util;

import java.util.Properties;

public class LinksSaveImage {
	private Properties links;

	public Properties getLinks() {
		return links;
	}

	public void setLinks(Properties links) {
		this.links = links;
	}

	public String getLink(String key) {
		return links.getProperty(key);
	}
}
