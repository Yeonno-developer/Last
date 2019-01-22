package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Comment;

public interface CommentMapper {
	
		@Insert("insert into shopcomment (comnum, writer,password, contents, readcnt) "
	         + "values(#{comnum},#{writer},#{password},#{contents}, 0)")
	   void insert(Comment comment);

	   @Select("select ifnull(max(comnum), 0) from shopcomment")
	   int maxnum();

	   @Update("update shopcomment  set contents=#{contents} where comnum=#{comnum}")
	   void readcntadd(Map<String, Integer> map);
	   
	   @Delete("delete from shopcomment where comnum=#{comnum}")
	   void delete(Map<String, Integer> param);
	   
//	   @Update("update shopcomment set readcnt=readcnt+1 where comnum=#{comnum}")
//	   void update(Comment comment);
	   
	   @Update("update shopcomment set contents=#{contents} where comnum=#{comnum}")
	   void update(Comment comment); 
}
