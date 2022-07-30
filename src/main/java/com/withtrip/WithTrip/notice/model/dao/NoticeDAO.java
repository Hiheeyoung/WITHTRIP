package com.withtrip.WithTrip.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.notice.model.vo.PageInfo;

@Repository("nDAO")
public class NoticeDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}
	
	public ArrayList<Notice> getFixNoticeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.getFixNoticeList", null);
	}

	public ArrayList<Notice> getNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getNoticeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getNoticeLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.getNoticeList", null, rowBounds);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int nId) {
		
		
		return sqlSession.update("noticeMapper.addReadCount", nId);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nId) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nId);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeId) {
		return sqlSession.delete("noticeMapper.deleteNotice", noticeId);
	}
	
	

}
