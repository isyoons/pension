package kr.pe.temp.pension.util;

import org.springframework.stereotype.Component;

@Component
public class PagingUtils {

	final int PAGE_PER_ARTICLE = 12;
	
	public int getTotalPage(int totalCount) {
		int totalPage = 1;
		if(totalCount > PAGE_PER_ARTICLE) {
			totalPage = totalCount / PAGE_PER_ARTICLE;
			if(totalCount % PAGE_PER_ARTICLE > 0) {
				totalPage = (totalCount / PAGE_PER_ARTICLE)+1;
			}
		}
		return totalPage;
	}
	
	public int getBeginIndex(int currentPage) {
		return (currentPage - 1) * PAGE_PER_ARTICLE;
	}
	
	public int getEndIndex() {
		return PAGE_PER_ARTICLE;
	}
}
