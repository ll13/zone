package com.mapper;


import java.util.List;
import com.po.Question;
public interface QuestionMapper {
	
	
	public  int insertQuestion(Question question);
    public  Question getQuestionbyid(Question question);  
    public List<Question> getQuestionbyPage(Question question);
    public List<Question> getQuestionWithPoint(Question question);
    public List<Question> getQuestionWithNoAnswer(Question question);
    public List<Question> getQuestionHaveAnswer(Question question);
    public  int getQuestionTotalRow();
    public  int getQuestionTotalRowPoint();
    public  int getQuestionTotalRowNoAnswer();
    public  int getQuestionTotalRowAnswer();
    public  int getIdbyTitle(Question question);
    public  int updateBrowsenum(Question question);
    public  int updateAnswernum(Question question);
    public  int addCollectnum(Question question);
    public  int delectCollectnum(Question question);
    public  List<Question> gethotQuestion();
   // public  List<Question> getNewQuestion();
    public  List<Question> getQuestionbyUsername(Question question);
    public  int updateQuestionbyquestionid(Question question);
    public  int delectQuestionbyquestionid(Question question);
    public  int getQuestionTotalRowMyquestion(Question question);
   // public int updateQuestionRightAnswer(Question question);
    //public List<Question> getQuestionbyKeyword(Question question);
    //public List<Question> getMyCollectQuestion(Question question);
}
