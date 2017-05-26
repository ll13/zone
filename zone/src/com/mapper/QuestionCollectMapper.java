package com.mapper;


import com.po.QuestionCollect;

public interface QuestionCollectMapper {
	public  int insertQuestionCollect(QuestionCollect questionCollect);
    public  int delectQuestionCollect(QuestionCollect questionCollect);
    public  QuestionCollect checkCollect(QuestionCollect questionCollect);
    
}
