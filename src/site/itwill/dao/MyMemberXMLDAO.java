package site.itwill.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import site.itwill.dto.MyMemberDTO;

public class MyMemberXMLDAO {
	private static MyMemberXMLDAO _dao;
	
	private MyMemberXMLDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MyMemberXMLDAO();
	}
	
	public static MyMemberXMLDAO getDAO() {
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
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺��� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int insertMember(MyMemberDTO member) {
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		try {
//			SqlSession.insert(String elementId, Object parameterValue) : INSERT ������ ��ϵ� ������Ʈ�� SQL ������ �����޾� ���� �� �������� ������ ��ȯ�ϴ� �޼ҵ�
			int rows=sqlSession.insert("site.itwill.mapper.MymemberXMLMapper.insertMember", member);
			
//			Mybatis Framework�� �⺻������ AutoCommit ����� ��Ȱ��ȭ ó���� �� SQL ���� ����
//			=> DML ������ ���� �� �ݵ�� TCL ���� �޼ҵ� ȣ��
			
//			<setting name="jdbcTypeForNull" value="NULL"/> �������� ���� ��ü������ Ŀ�� �ѹ� ����
//			SqlSession.commit() : Ʈ������ ���� ���� (COMMIT)�� �����Ͽ� �����ϴ� �޼ҵ�
//			SqlSession.rollback() : Ʈ������ ���� ���� (ROLLBACK)�� �����Ͽ� �����ϴ� �޼ҵ�
			if(rows>0) sqlSession.commit();
			else sqlSession.rollback();
			
			return rows;
		} finally {
			sqlSession.close();
		}
	}
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺��� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int updateMember(MyMemberDTO member) {
//		SqlSessionFactory.openSession(boolean autoCommit) : Sqlsession �ν��Ͻ��� �����Ͽ� ��ȯ�ϴ� �޼ҵ�
//		=> false : AutoCommit ��� ��Ȱ��(�⺻), true : AutoCommit ��� Ȱ��
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		
		try {
//			SqlSession.update(String elementId, Object parameterValue) : UPDATE ������ ��ϵ� ������Ʈ�� SQL ������ �����޾� ���� �� �������� ������ ��ȯ�ϴ� �޼ҵ�
			return sqlSession.update("site.itwill.mapper.MymemberXMLMapper.updateMember", member);
		} finally {
			sqlSession.close();
		}
	}
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺��� ����� ȸ�������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int deleteMember(String id) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
//			SqlSession.delete(String elementId, Object parameterValue) : DELETE ������ ��ϵ� ������Ʈ�� SQL ������ �����޾� ���� �� �������� ������ ��ȯ�ϴ� �޼ҵ�
			return sqlSession.delete("site.itwill.mapper.MymemberXMLMapper.deleteMember", id);
		} finally {
			sqlSession.close();
		}
	}
	
//	ȸ�������� ���޹޾� MYMEMBER ���̺��� ����� ȸ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public MyMemberDTO selectMember(String id) {
		SqlSession sqlSession=getSqlSessionFactory().openSession(true);
		try {
//			SqlSession.selectOne(String elementId[, Object parameterValue]) : SELECT ������ ��ϵ� ������Ʈ�� SQL ������ �����޾� ���� �� �ϳ��� �˻������ ��ȯ�ϴ� �޼ҵ�
			return sqlSession.selectOne("site.itwill.mapper.MymemberXMLMapper.selectMember", id);
		} finally {
			sqlSession.close();
		}
	}
	
//	MYMEMBER ���̺��� ����� ��� ȸ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public List<MyMemberDTO> selectAllMember(){
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		try {
//			SqlSession.selectList(String elementId[, Object parameterValue]) : SELECT ������ ��ϵ� ������Ʈ�� SQL ������ �����޾� ���� �� �������� �˻������ ������ List �ν��Ͻ��� ��ȯ�ϴ� �޼ҵ�
			return sqlSession.selectList("site.itwill.mapper.MymemberXMLMapper.selectAllMember");
		} finally {
			sqlSession.close();
		}
		
	};
	
}