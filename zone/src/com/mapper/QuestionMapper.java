package com.mapper;


import java.util.List;
import com.po.Question;
public interface QuestionMapper {
	
	public List<Question> getQuestionbyPage(Question question);
	public  int insertQuestion(Question question);
    public  Question getQuestionbyid(Question question);
    public  int getQuestionTotalRow();
}
