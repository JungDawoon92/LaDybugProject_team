package com.shepe.client.comment;

import java.util.List;

public interface CommentService {
	
	void insertComment(CommentVO commentvo);

	void updateComment(CommentVO commentvo);
	
	void deleteComment(CommentVO commentvo);
	
	int getCommentCnt(CommentVO commentvo);
	
	List<CommentVO> getCommentList(CommentVO commentvo);
	
	void updateMemberImg(CommentVO commentvo);
	
}
