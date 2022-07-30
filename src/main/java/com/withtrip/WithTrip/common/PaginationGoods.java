package com.withtrip.WithTrip.common;

import com.withtrip.WithTrip.goods.model.vo.PageInfo;

public class PaginationGoods {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 9;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage - 1)/pageLimit*pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
}
