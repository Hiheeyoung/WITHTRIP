package com.withtrip.WithTrip.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withtrip.WithTrip.notice.model.dao.NoticeDAO;
import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.notice.model.vo.PageInfo;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return nDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Notice> getFixNoticeList() {
		return nDAO.getFixNoticeList(sqlSession);
	}

	@Override
	public ArrayList<Notice> getNoticeList(PageInfo pi) {
		return nDAO.getNoticeList(sqlSession, pi);
	}

	@Override
	public Notice selectNotice(int nId) {
		int result = nDAO.addReadCount(sqlSession, nId);
		
		Notice n = null;
		
		if(result > 0) {
			n = nDAO.selectNotice(sqlSession, nId);
			
		}
		return n;
	}

	@Override
	public int insertNotice(Notice n) {
		return nDAO.insertNotice(sqlSession, n);
	}

	@Override
	public int updateNotice(Notice n) {
		return nDAO.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeId) {
		return nDAO.deleteNotice(sqlSession, noticeId);
	}
	
	

}