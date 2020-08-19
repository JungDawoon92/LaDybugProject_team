package com.shepe.admin.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shepe.admin.comment.CommentAdminService;
import com.shepe.admin.comment.CommentAdminVO;

@Service
public class CommentAdminServiceImpl implements CommentAdminService {

	@Autowired
	private CommentAdminDaoMybatis commentDAO;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertComment(CommentAdminVO commentvo) {
		commentDAO.insertComment(commentvo);
//		throw new RuntimeException("roll back");
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void updateComment(CommentAdminVO commentvo) {
		commentDAO.updateComment(commentvo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteComment(CommentAdminVO commentvo) {
		commentDAO.deleteComment(commentvo);
	}

	@Override
	public int getCommentCnt(CommentAdminVO commentvo) {
		return commentDAO.getCommentCnt(commentvo);
	}
	
	@Override
	public List<CommentAdminVO> getCommentList(CommentAdminVO commentvo) {
		return commentDAO.getCommentList(commentvo);
	}

	@Override
	public void updateMemberImg(CommentAdminVO commentvo) {
		commentDAO.updateMemberImg(commentvo);
	}

	@Override
	public List<CommentAdminVO> getCommentTopChart(CommentAdminVO commentvo) {
		return commentDAO.getCommentTopChart(commentvo);
	}
}
