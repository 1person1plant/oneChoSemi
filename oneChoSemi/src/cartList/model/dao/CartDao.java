package cartList.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cartList.model.vo.Cart;

import static common.JDBCTemplate.close;

public class CartDao {

	public ArrayList<Cart> cartList(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rSet = null;
		
		ArrayList<Cart> cartList = new ArrayList<>();
		
		String query = "SELECT MEMBER_NO , ITEM_NO , ITEM_NAME , ITEM_PRICE , ITEM_MAX , CARTLIST_COUNT , IMAGE_NAME FROM MEMBER_CARTLIST WHERE MEMBER_NO =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			rSet = pstmt.executeQuery();
			
			while(rSet.next()) {
				Cart c = new Cart(rSet.getString("MEMBER_NO")
								, rSet.getString("ITEM_NO")
								, rSet.getString("ITEM_NAME")
								, rSet.getInt("ITEM_PRICE")
								, rSet.getInt("ITEM_MAX")
								, rSet.getInt("CARTLIST_COUNT")
								, rSet.getString("IMAGE_NAME")
								 );
				cartList.add(c);
			}
			System.out.println("CartDao : " + cartList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rSet);
		}

		return cartList;
	}

}