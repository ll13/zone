package com.mapper;


import java.util.List;
import com.po.Question;
public interface QuestionMapper {
	
	public List<Question> getAll();
	public  int insertQuestion(Question question);

}
