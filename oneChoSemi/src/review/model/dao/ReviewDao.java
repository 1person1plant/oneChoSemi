package review.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import review.model.vo.Review;

public class ReviewDao {

	// 리뷰 게시판 한 페이지 내에 뿌려줄 리스트
	public ArrayList selectList(Connection conn, int currentPage, int limit) {

		ArrayList list = new ArrayList();
		
		return list;
	}

	// 선택한 리뷰 조회하기
	public Review selectReview(Connection conn, int id) {
		
		Review review = null;
		
		return review;
	}
	
	// 리뷰 수정하기

	public int updateReview(Connection conn, Review review) {
		
		int result = 0;
		
		return result;
	}

	// 리뷰 삭제하기
	public int deleteReview(Connection conn, Review review) {
		
		int result = 0;
		
		return result;
	}

}
