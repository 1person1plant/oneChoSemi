package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import review.model.dao.ReviewDao;
import review.model.vo.Review;

public class ReviewService {
	
	// 리뷰 게시판 한 페이지 내에 뿌려줄 리스트
	public ArrayList selectList(int currentPage, int limit) {
		
		Connection conn = getConnection();
		
		ArrayList list = new ReviewDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	// 선택한 리뷰 조회하기
	public Review selectReview(int id) {
		
		Connection conn = getConnection();
		
		Review review = new ReviewDao().selectReview(conn, id);
		
		close(conn);
		
		return review;
	}
	
	// 리뷰 수정하기
	public int updateReview(Review review) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().updateReview(conn, review);
		
		close(conn);
		
		return result;
	}
	
	// 리뷰 삭제하기
	public int deleteReview(Review review) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn, review);
		
		close(conn);
		
		return result;
	}
	
	
	
}
