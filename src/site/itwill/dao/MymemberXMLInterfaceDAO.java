package site.itwill.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import site.itwill.dto.MyMemberDTO;
import site.itwill.mapper.MymemberXMLInterfaceMapper;

public class MymemberXMLInterfaceDAO {

private static MymemberXMLInterfaceDAO _dao;
	
	private MymemberXMLInterfaceDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MymemberXMLInterfaceDAO();
	}
	
	public static MymemberXMLInterfaceDAO getDAO() {
		return _dao;
	}
	
	private SqlSessionFactory getSqlSessionFactory() {
		String resource="mybatis-config.xml";
		InputStream inputstream=null;
		
		try {
			inputstream=Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputstream);
	}
	
//	회원정보를 전달받아 MYMEMBER 테이블에 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertMember(MyMemberDTO member) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
//			SqlSession.getMapper(Class<T> clazz) : 메모리에 저장된 Interface Mapper 파일을 메모리에 저장하고 Class 인스턴스로 반환하는 메소드  
//			Interface Mapper 파일로 인스턴스를 생성하여 추상메소드 호출 => 추상메소드에 등록된 SQL 명령을 제공받아 실행
			return sqlSession.getMapper(MymemberXMLInterfaceMapper.class).insertMember(member);
		} finally {
			sqlSession.close();
		}
	}
	
	
//	회원정보를 전달받아 MYMEMBER 테이블에 저장된 회원정보를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateMember(MyMemberDTO member) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberXMLInterfaceMapper.class).updateMember(member);
		} finally {
			sqlSession.close();
		}
	}
	
	
//	회원정보를 전달받아 MYMEMBER 테이블에 저장된 회원정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteMember(String id) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberXMLInterfaceMapper.class).deleteMember(id);
		} finally {
			sqlSession.close();
		}
	}
	
//	회원정보를 전달받아 MYMEMBER 테이블에 저장된 회원정보 검색하여 반환하는 메소드
	public MyMemberDTO selectMember(String id) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberXMLInterfaceMapper.class).selectMember(id);
		} finally {
			sqlSession.close();
		}
	}
	
//	MYMEMBER 테이블에 저장된 모든 회원정보 검색하여 반환하는 메소드
	public List<MyMemberDTO> selectAllMember() {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberXMLInterfaceMapper.class).selectAllMember();
		} finally {
			sqlSession.close();
		}
	}
}
