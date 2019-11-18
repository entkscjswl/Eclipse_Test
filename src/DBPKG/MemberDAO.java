package DBPKG;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getinstance() {
		return instance;
	}
	private MemberDAO() {}
	
	public static Connection getConnection() throws SQLException{
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName(jdbc_driver);
			Connection conn = DriverManager.getConnection(db_url,"system","1234");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String count() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String count = null;
		try {
			conn = getConnection();
			sql = "select max(custno)+1 from member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return count;
	}
	
	public void insert(MemberVO vo) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "insert into member_tbl_02 values(?,?,?,?,to_date(?,'yyyymmdd'),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(vo.getCustno()));
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	
	public ArrayList<MemberVO> memberList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<MemberVO> mvo = new ArrayList<MemberVO>();
		try {
			conn = getConnection();
			sql = "select * from member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5).substring(0,10));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
				mvo.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return mvo;
	}
	
	public ArrayList<MemberVO> saleList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<MemberVO> svo = new ArrayList<MemberVO>();
		try {
			conn = getConnection();
			sql = "select a.custno, a.custname, a.grade, sum(b.price) as sprice from member_tbl_02 a join money_tbl_02 b on a.custno=b.custno group by a.custno, a.custname, a.grade order by sprice desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setGrade(rs.getString(3));
				vo.setPrice(rs.getString(4));
				svo.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return svo;
	}
	
	public MemberVO readOne(String upd) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql = null;
		MemberVO vo = new MemberVO();
		try {
			conn = getConnection();
			sql = "select custno, custname,phone,address,to_char(joindate,'yyyymmdd'),grade,city from member_tbl_02 where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, upd);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return vo;
	}
	
	public void update(MemberVO vo) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=to_date(?,'yyyymmdd'),grade=?,city=? where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getJoindate());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.setInt(7, Integer.parseInt(vo.getCustno()));
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
	}
}




















