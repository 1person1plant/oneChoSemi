package item.model.service;

import item.model.dao.ItemDao;
import item.model.vo.Item;
import item.model.vo.ItemImage;

import static common.JDBCTemplate.*;

import java.sql.Connection;

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

}
