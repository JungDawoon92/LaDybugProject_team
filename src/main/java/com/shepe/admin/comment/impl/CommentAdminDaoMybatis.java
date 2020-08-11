package com.shepe.admin.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.admin.comment.CommentAdminVO;

@Repository
public class CommentAdminDaoMybatis {

	@Autowired
	private SqlSessionTemplate comment;
	
	public void insertComment(CommentAdminVO commentvo) {
		comment.insert("adcommentDAO.insertComment", commentvo);
	}
	
	public void updateComment(CommentAdminVO commentvo) {
		comment.update("adcommentDAO.updateComment", commentvo);
	}
	
	public void deleteComment(CommentAdminVO commentvo) {
		comment.delete("adcommentDAO.deleteComment", commentvo);
	}
	public int getCommentCnt(CommentAdminVO commentvo) {
		return comment.selectOne("adcommentDAO.getCommentCnt", commentvo);
	}
	
	public List<CommentAdminVO> getCommentList(CommentAdminVO commentvo) {
		return comment.selectList("adcommentDAO.getCommentList", commentvo);
	}
	
	public void updateMemberImg(CommentAdminVO commentvo) {
		comment.update("adcommentDAO.updateMemberImg", commentvo);
	}

	public List<CommentAdminVO> getCommentTopChart(CommentAdminVO commentvo) {
		return comment.selectList("adcommentDAO.getCommentTopChart", commentvo);
	}
}
