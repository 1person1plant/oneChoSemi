package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.vo.Member;
import member.model.vo.Rank;

public class MemberDao {
	
	/**
	 * 로그인
	 * @param conn
	 * @param member
	 * @return
	 */
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member loginUser = null;

		String query = "SELECT MEMBER_NO" + 
							", MEMBER_ADMIN" +
							", MEMBER_ID" + 
							", MEMBER_PWD" + 
							", MEMBER_NAME" + 
							", MEMBER_PHONE1" + 
							", MEMBER_PHONE2" + 
							", MEMBER_PHONE3" + 
							", MEMBER_EMAIL1" + 
							", MEMBER_EMAIL2" + 
							", MEMBER_POSTCODE" + 
							", MEMBER_ADDRESS1" + 
							", MEMBER_ADDRESS2" + 
							", MEMBER_STATUS" + 
							", MEMBER_POINT" + 
							", MEMBER_RANK" + 
						" FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PWD=? AND MEMBER_STATUS = 'N'";
		
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
									   rs.getString("MEMBER_STATUS"),
									   rs.getInt("MEMBER_POINT"),
									   rs.getString("MEMBER_RANK")
									   );
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginUser;
	}

	
	/**
	 * 카카오 로그인 기능
	 * @param member
	 * @return
	 */
	public Member kakaoLoginMember(Connection conn, Member member) {
		return null;
	}
	
	/**
	 * 회원가입
	 * @param member 회원가입을 한 회원 정보
	 * @return
	 */
	public int insertMember(Connection conn, Member member) {
		return 0;
	}
	
	/**
	 * 카카오 회원가입 
	 * @param member
	 * @return
	 */
	public int kakaoinsertMember(Connection conn, Member member) {
		return 0;
	}
	
	/**
	 * 아이디 중복체크
	 * @param id 회원가입시에 입력한 아이디
	 * <br> Count 쿼리문을 통해서 0이면 중복이 없고 1이면 중복이 있다만 체크
	 * @return
	 */
	public int joinIdChkMember(Connection conn, String id) {
		return 0;
	}
	
	/**
	 * 아이디 찾기
	 * @param member 입력된 휴대폰 번호+이메일
	 * @return
	 */
	public Member searchIdMember(Connection conn, Member member) {
		return null;
	}
	
	/**
	 * 비밀번호 찾기
	 * @param member 입력된 아이디 +이메일 
	 * @return
	 */
	public Member searchPwdMember(Connection conn, Member member) {
		return null;
	}
	
	/**
	 * 등급
	 * @param conn
	 * @param userNo
	 * @return
	 */
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
