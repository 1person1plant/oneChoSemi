package item.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static common.JDBCTemplate.*;

import item.model.vo.Item;
import item.model.vo.ItemImage;

public class ItemDao {

	public int insertItem(Connection conn, Item item) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="insert into item values('I'||ITEM_SEQ.NEXTVAL,?,?,?,?,?,null,?,?,?,SYSDATE,SYSDATE,?,'Y')";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, item.getItemName());
			pstmt.setString(2, item.getItemCategory());
			pstmt.setString(3, item.getItemKeywordNo());
			pstmt.setInt(4, item.getItemPrice());
			pstmt.setInt(5, item.getItemDiscount());
			pstmt.setInt(6, item.getItemStock());
			pstmt.setString(7, item.getItemDisplay());
			pstmt.setString(8, item.getItemInfo());
			pstmt.setInt(9, item.getItemMax());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertImage(Connection conn, ItemImage im) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String query="insert into image values('IMG'||IMAGE_SEQ.NEXTVAL,?,?)";
		
		try {
		for(int i=0;i<2;i++) {
			
			if(i==0) {
					pstmt=conn.prepareStatement(query);
					pstmt.setString(1,im.getmPath());
					pstmt.setString(2, im.getmImgName());
					result+=pstmt.executeUpdate();
					
			}else {
				
					pstmt=conn.prepareStatement(query);
					pstmt.setString(1, im.getsPath());
					pstmt.setString(2, im.getsImgName());
					result+=pstmt.executeUpdate();
					
			}
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

	public int insertItemImage(Connection conn) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
		for(int i=0;i<2;i++) {
			
			if(i==0) {
				
				String query="insert into itemimage values('II'||ITEMIMAGE_SEQ.nextval,'I'||item_seq.currval,'IMG'||(IMAGE_SEQ.currval-1),1)";
				pstmt=conn.prepareStatement(query);
				result+=pstmt.executeUpdate();	
			
			}else {
				String query="insert into itemimage values('II'||ITEMIMAGE_SEQ.nextval,'I'||item_seq.currval,'IMG'||(IMAGE_SEQ.currval),2)";
				pstmt=conn.prepareStatement(query);
				result+=pstmt.executeUpdate();
			
			}
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
