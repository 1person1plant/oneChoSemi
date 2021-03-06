
package item.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				
				System.out.println("메인이미지를 아이템이미지 테이블에 넣는다.");				
				String query="INSERT INTO ITEMIMAGE VALUES('II'||ITEMIMAGE_SEQ.NEXTVAL,(select max(item_no) from item),(select concat('IMG',substr(max(image_no),4)-1) from image),1)";
				pstmt=conn.prepareStatement(query);
				result+=pstmt.executeUpdate();	
			
			}else {
				System.out.println("서브이미지를 아이템이미지 테이블에 넣는다.");	
				String query="INSERT INTO ITEMIMAGE VALUES('II'||ITEMIMAGE_SEQ.NEXTVAL,(select max(item_no)from item),(select max(image_no)from image),2)";
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

	public ArrayList<Item> selectAllItems(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Item> items = new ArrayList<>();
		
		String query="SELECT * FROM ITEM";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Item i=new Item(rset.getString("ITEM_NO"),rset.getString("ITEM_NAME"),rset.getString("ITEM_CATEGORY"),rset.getString("KEYWORD_NO"),rset.getInt("ITEM_PRICE"),
						rset.getInt("ITEM_DISCOUNT"),rset.getInt("ITEM_RATE"),rset.getInt("ITEM_STOCK"),rset.getString("ITEM_DISPLAY"),rset.getString("ITEM_INFO"),
						rset.getDate("ITEM_CDATE"),rset.getDate("ITEM_UDATE"),rset.getInt("ITEM_MAX"),rset.getString("ITEM_SALE"));
				
				items.add(i);
				
			}
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return items;
	}

	public ItemImage selectItemImg(Connection conn, String pNum) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ItemImage itemImg=null;
		
		String query="SELECT * FROM V_ITEMIMAGE WHERE ITEM_NO=?";
	
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, pNum);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				
				itemImg=new ItemImage(rset.getString("ITEM_NO"),rset.getString("mItemImgNo"),rset.getString("mainImgNo"),
						rset.getString("mainImgName"),rset.getString("mainPath"),
						rset.getString("sItemImgNo"),rset.getString("subImgNo"),rset.getString("subImgName"),rset.getString("subPath"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return itemImg;
	}

	public ArrayList<ItemImage> selectItemImg(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<ItemImage> images=new ArrayList<>();
		
		String query="SELECT * FROM V_ITEMIMAGE ";
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				ItemImage itemImg=new ItemImage(rset.getString("ITEM_NO"),rset.getString("mItemImgNo"),rset.getString("mainImgNo"),
						rset.getString("mainImgName"),rset.getString("mainPath"),
						rset.getString("sItemImgNo"),rset.getString("subImgNo"),rset.getString("subImgName"),rset.getString("subPath"));
				
				images.add(itemImg);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		return images;
	}

}
