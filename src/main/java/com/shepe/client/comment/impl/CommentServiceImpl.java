package com.shepe.client.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shepe.client.comment.CommentService;
import com.shepe.client.comment.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDaoMybatis commentDAO;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertComment(CommentVO commentvo) {
		commentDAO.insertComment(commentvo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void updateComment(CommentVO commentvo) {
		commentDAO.updateComment(commentvo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteComment(CommentVO commentvo) {
		commentDAO.deleteComment(commentvo);
	}

	@Override
	public int getCommentCnt(CommentVO commentvo) {
		return commentDAO.getCommentCnt(commentvo);
	}
	
	@Override
	public List<CommentVO> getCommentList(CommentVO commentvo) {
		return commentDAO.getCommentList(commentvo);
	}

	@Override
	public void updateMemberImg(CommentVO commentvo) {
		commentDAO.updateMemberImg(commentvo);
	}

}
