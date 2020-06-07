package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.vo.Member;
import member.model.vo.Rank;

import static common.JDBCTemplate.close;

public class MemberDao {

	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member loginUser = null;

		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=? AND MEMBER_STATUS = 'N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginUser = new Member(rs.getString("MEMBER_NO"),
									   rs.getString("MEMBER_ADMIN"),
									   rs.getString("MEMBER_ID"),
									   rs.getString("MEMBER_PWD"),
									   rs.getString("MEMBER_NAME"),
									   rs.getString("MEMBER_PHONE1"),
									   rs.getString("MEMBER_PHONE2"),
									   rs.getString("MEMBER_PHONE3"),
									   rs.getString("MEMBER_EMAIL1"),
									   rs.getString("MEMBER_EMAIL2"),
									   rs.getString("MEMBER_POSTCODE"),
									   rs.getString("MEMBER_ADDRESS1"),
									   rs.getString("MEMBER_ADDRESS2"),
									   rs.getDate("MEMBER_JOINDATE"),
									   rs.getString("MEMBER_STATUS"),
									   rs.getString("MEMBER_EXIT"),
									   rs.getInt("MEMBER_POINT"),
									   rs.getString("MEMBER_RANK")
									   );
			}
			System.out.println("MemberDao : " + loginUser);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginUser;
	}

	public Rank rankDetail(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Rank rankDetail = null;

		String query = "SELECT * FROM RANK JOIN (SELECT MEMBER_RANK FROM MEMBER WHERE MEMBER_NO = ?) ON (MEMBER_RANK = RANK_NO)";
		
		System.out.println("여기옴?");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rankDetail = new Rank(rs.getString("RANK_NO"),
									   rs.getString("RANK_NAME"),
									   rs.getInt("RANK_POINTRAT"),
									   rs.getInt("RANK_POINTCAP"),
									   rs.getInt("RANK_POINTCAP"),
									   rs.getInt("RANK_POINTCAP")
									   );
			}
			System.out.println("MemberDao rankDetail : " + rankDetail);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return rankDetail;
	}


}
