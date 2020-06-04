package cartList.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import cartList.model.dao.CartDao;
import cartList.model.vo.Cart;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

public class CartService {

	public ArrayList<Cart> cartList(String userNo) {
		Connection conn = getConnection();

		ArrayList<Cart> cartList = new CartDao().cartList(conn, userNo);
				
		close(conn);
		return cartList;
	}

}
