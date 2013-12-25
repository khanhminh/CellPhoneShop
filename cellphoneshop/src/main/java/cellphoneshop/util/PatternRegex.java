package cellphoneshop.util;

import java.util.Properties;

public class PatternRegex {
	private Properties patternList;
	
	public void setPatternList(Properties patternList) {
		this.patternList = patternList;
	}
	
	public String getPattern(String name){
		return patternList.getProperty(name);
	}
}
