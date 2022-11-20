package com.example.dao;

import com.example.bean.FoodVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class FoodDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String Food_INSERT = "insert into Food (title, writer,photo,kind , detail) values (?,?,?,?,?)";
	private final String Food_UPDATE = "update Food set title=?, writer=?, photo=?, kind=?,detail=? where seq=?";
	private final String Food_DELETE = "delete from Food  where seq=?";
	private final String Food_GET = "select * from Food  where seq=?";
	private final String Food_LIST = "select * from Food order by seq desc";

	public int insertFood(FoodVO vo) {
		System.out.println("===> JDBC로 insertFood() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(Food_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getPhoto());
			stmt.setString(4, vo.getKind());
			stmt.setString(5, vo.getDetail());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteFood(FoodVO vo) {
		System.out.println("===> JDBC로 deleteFood() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(Food_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateFood(FoodVO vo) {
		System.out.println("===> JDBC로 updateFood() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(Food_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getPhoto());
			stmt.setString(4,vo.getKind());
			stmt.setString(5, vo.getDetail());
			stmt.setInt(6, vo.getSeq());
			
			
			System.out.println(vo.getTitle() + "-" + vo.getWriter() +"-"+vo.getPhoto()+"-"+vo.getKind()+ "-" + vo.getDetail() + "-" + vo.getSeq());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public FoodVO getFood(int seq) {
		FoodVO one = new FoodVO();
		System.out.println("===> JDBC로 getFood() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(Food_GET);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSeq(rs.getInt("seq"));
				one.setTitle(rs.getString("title"));
				one.setWriter(rs.getString("writer"));
				one.setKind(rs.getString("kind"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
				one.setCnt(rs.getInt("cnt"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<FoodVO> getFoodList(){
		List<FoodVO> list = new ArrayList<FoodVO>();
		System.out.println("===> JDBC로 getFoodList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(Food_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				FoodVO one = new FoodVO();
				one.setSeq(rs.getInt("seq"));
				one.setTitle(rs.getString("title"));
				one.setWriter(rs.getString("writer"));
				one.setPhoto(rs.getString("photo"));
				one.setKind(rs.getString("kind"));
				one.setDetail(rs.getString("detail"));
				one.setRegdate(rs.getDate("regdate"));
				one.setCnt(rs.getInt("cnt"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	public String getPhotoFilename(int sid){
		String filename = null;
		try{
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(Food_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()){
				filename = rs.getString("photo");
			}
			rs.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
		return filename;
	}
}
