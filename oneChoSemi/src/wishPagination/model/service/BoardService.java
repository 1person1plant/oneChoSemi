package wishPagination.model.service;

import wishPagination.model.dao.BoardDao;
import wishPagination.model.vo.wishBoard;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class BoardService {

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new BoardDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<wishBoard> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList list = new BoardDao().selectList(conn, currentPage, limit);
		close(conn);
		return list;
	}

}
