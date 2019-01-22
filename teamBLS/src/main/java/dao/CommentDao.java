package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.CommentMapper;
import logic.Comment;
import logic.User;

@Repository
public class CommentDao {
	  @Autowired
	   private SqlSessionTemplate sqlSession;
	   private final String NS="dao.mapper.CommentMapper.";
	   
	   public void commentRegister(Comment comment) {
	      sqlSession.getMapper(CommentMapper.class).insert(comment);
	   }
	   
	   public int maxnum() {
	      int i = sqlSession.getMapper(CommentMapper.class).maxnum();
	      return i;
	   }
	   
	   public List<Comment> commentlist(){
	      return sqlSession.selectList(NS+"list");
	   }
	   
	   public Comment select(Integer comnum) {
			Map<String,Integer> map = new HashMap<String, Integer>();
			map.put("comnum", comnum);
			return sqlSession.selectOne(NS+"list",map);
		}
	   
	   public void readcntadd(Integer comnum) {
			Map<String,  Integer> map = new HashMap<String,Integer>();
			map.put("comnum", comnum);	
			sqlSession.getMapper(CommentMapper.class).readcntadd(map);
		}


	public void cmdelete(Integer comnum) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("comnum", comnum);
		sqlSession.getMapper(CommentMapper.class).delete(param);
	}
	
	public Comment selectuser(Integer comnum) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("comnum", comnum);
		return sqlSession.selectOne(NS+"list",map);
	}

	public void update(Comment comment) {
		sqlSession.getMapper(CommentMapper.class).update(comment);
		
	}
}
