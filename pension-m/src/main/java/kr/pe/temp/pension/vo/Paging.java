package kr.pe.temp.pension.vo;

public class Paging {
	int totalCount;
	int totalPage;
	int currentPage;
	int beginIndex;
	int endIndex;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getBeginIndex() {
		return beginIndex;
	}
	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	@Override
	public String toString() {
		return String
				.format("Paging [totalCount=%s, totalPage=%s, currentPage=%s, beginIndex=%s, endIndex=%s]",
						totalCount, totalPage, currentPage, beginIndex,
						endIndex);
	}
	
	
}
