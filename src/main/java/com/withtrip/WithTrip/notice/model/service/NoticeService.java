package com.withtrip.WithTrip.notice.model.service;

import java.util.ArrayList;

import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.notice.model.vo.PageInfo;

public interface NoticeService {

	int getListCount();

	ArrayList<Notice> getFixNoticeList();
	
	ArrayList<Notice> getNoticeList(PageInfo pi);

	Notice selectNotice(int nId);

	int insertNotice(Notice n);

	int updateNotice(Notice n);

	int deleteNotice(int noticeId);

}
