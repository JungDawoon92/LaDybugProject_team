package com.shepe.admin.comment;

import java.util.List;

public interface CommentAdminService {
	
	void insertComment(CommentAdminVO commentvo);

	void updateComment(CommentAdminVO commentvo);
	
	void deleteComment(CommentAdminVO commentvo);
	
	int getCommentCnt(CommentAdminVO commentvo);
	
	List<CommentAdminVO> getCommentList(CommentAdminVO commentvo);
	
	void updateMemberImg(CommentAdminVO commentvo);
	
	/* 코멘트 TOP 레시피 차트 */
	List<CommentAdminVO> getCommentTopChart(CommentAdminVO commentvo);
}
