package site.itwill.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import site.itwill.dto.MyMemberDTO;
import site.itwill.mapper.MymemberInterfaceMapper;

//	Interface Mapper ���Ͽ� ��ϵ� SQL ����� �����޾� �ۼ��� DAO Ŭ����
public class MyMemberInterfaceDAO {

	private static MyMemberInterfaceDAO _dao;
	
	private MyMemberInterfaceDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MyMemberInterfaceDAO();
	}
	
	public static MyMemberInterfaceDAO getDAO() {
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
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int insertMember(MyMemberDTO member) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
//			SqlSession.getMapper(Class<T> clazz) : �޸𸮿� ����� Interface Mapper ������ �޸𸮿� �����ϰ� Class �ν��Ͻ��� ��ȯ�ϴ� �޼ҵ�  
//			Interface Mapper ���Ϸ� �ν��Ͻ��� �����Ͽ� �߻�޼ҵ� ȣ�� => �߻�޼ҵ忡 ��ϵ� SQL ����� �����޾� ����
			return sqlSession.getMapper(MymemberInterfaceMapper.class).insertMember(member);
		} finally {
			sqlSession.close();
		}
	}
	
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int updateMember(MyMemberDTO member) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberInterfaceMapper.class).updateMember(member);
		} finally {
			sqlSession.close();
		}
	}
	
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int deleteMember(String id) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberInterfaceMapper.class).deleteMember(id);
		} finally {
			sqlSession.close();
		}
	}
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺� ����� ȸ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public MyMemberDTO selectMember(String id) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberInterfaceMapper.class).selectMember(id);
		} finally {
			sqlSession.close();
		}
	}
	
//	MYMEMBER ���̺� ����� ��� ȸ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public List<MyMemberDTO> selectAllMember() {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
			return sqlSession.getMapper(MymemberInterfaceMapper.class).selectAllMember();
		} finally {
			sqlSession.close();
		}
	}
	
}
