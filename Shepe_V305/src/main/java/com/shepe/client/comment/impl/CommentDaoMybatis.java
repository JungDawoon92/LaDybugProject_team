package com.shepe.client.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shepe.client.comment.CommentVO;

@Repository
public class CommentDaoMybatis {

	@Autowired
	private SqlSessionTemplate comment;
	
	public void insertComment(CommentVO commentvo) {
		comment.insert("commentDAO.insertComment", commentvo);
	}
	
	public void updateComment(CommentVO commentvo) {
		comment.update("commentDAO.updateComment", commentvo);
	}
	
	public void deleteComment(CommentVO commentvo) {
		comment.delete("commentDAO.deleteComment", commentvo);
	}
	public int getCommentCnt(CommentVO commentvo) {
		return comment.selectOne("commentDAO.getCommentCnt", commentvo);
	}
	
	public List<CommentVO> getCommentList(CommentVO commentvo) {
		return comment.selectList("commentDAO.getCommentList", commentvo);
	}
	
	public void updateMemberImg(CommentVO commentvo) {
		comment.update("commentDAO.updateMemberImg", commentvo);
	}
	
}
