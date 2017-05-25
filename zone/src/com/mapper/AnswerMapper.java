package com.mapper;

import java.util.List;
import com.po.Answer;
public interface AnswerMapper {
	
	
	public  int insertAnswer(Answer answer);
    public  List<Answer> getAnswerbyqid(Answer answer);
    public  int updateAnswerRight(Answer answer);
}
