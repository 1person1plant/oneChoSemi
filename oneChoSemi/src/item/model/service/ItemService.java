
package item.model.service;

import item.model.dao.ItemDao;
import item.model.vo.Item;
import item.model.vo.ItemImage;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class ItemService {

	public int insertItem(Item item) {
		
		Connection conn=getConnection();
		
		int result=new ItemDao().insertItem(conn,item);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int insertImage(ItemImage im) {
		
		Connection conn=getConnection();
		
		int result=new ItemDao().insertImage(conn,im);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		
		return result;
	}

	public int insertItemImage() {
		
		Connection conn=getConnection();
		
		int result=new ItemDao().insertItemImage(conn);
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Item> selectAllItems() {
		
		Connection conn=getConnection();
		
		ArrayList<Item> items=new ItemDao().selectAllItems(conn);
		
		close(conn);
		return items;
	}

	public ItemImage selectItemImg(String pNum) {
		
		Connection conn=getConnection();
		ItemImage itemImg=new ItemDao().selectItemImg(conn,pNum);
		
		close(conn);
		return itemImg;
	}

	public ArrayList<ItemImage> selectItemImg() {
		
		Connection conn=getConnection();
		ArrayList<ItemImage> images=new ItemDao().selectItemImg(conn);
		
		close(conn);
		return images;
	}

}

