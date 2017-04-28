package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.AnswerMapper;
import com.mapper.QuestionMapper;
import com.po.Answer;
import com.po.Question;
import com.util.Cache;



@Controller
public class AskController {
	
	@Resource(name="questionMapper")
	QuestionMapper questionMapper;
	@Resource(name="answerMapper")
	AnswerMapper answerMapper;
	
	int questionPageSize=3;
	
	
	
	@RequestMapping("/addQuestion.do")
	public @ResponseBody String addQuestion(String user,String title,String questionContent,String question_point){
		Question question=new Question();
		question.setUsername(user);
		question.setTitle(title);
		question.setContent(questionContent);
		question.setPoint(question_point);
		
		
		questionMapper.insertQuestion(question);
		String questionid=questionMapper.getIdbyTitle(question)+"";
		return questionid;
	}
	
	@RequestMapping("/getQuestionTotalPage.do")
	public @ResponseBody String getQuestionTotalPage(String type){
		Cache cache=Cache.getInstance();
		int totalRow=0;
		if(cache.getElementbyKey("questionPage"+type)==null){
		 
		 Question questionPage=new Question();
		
		 if(type.equals("all")){
			 totalRow=questionMapper.getQuestionTotalRow();
	     }
		 if(type.equals("point")){
			 totalRow=questionMapper.getQuestionTotalRowPoint();
		 }
		 if(type.equals("noanswer")){
			 totalRow=questionMapper.getQuestionTotalRowNoAnswer();
		 }
		 if(type.equals("answer")){
			 totalRow=questionMapper.getQuestionTotalRowAnswer();
		 }
		 questionPage.setTotalRow(totalRow);
	     cache.putElementbyKey("questionPage"+type, questionPage);
		}else{
		  totalRow=((Question)cache.getElementbyKey("questionPage"+type)).getTotalRow();	
		}
		int totalPage=Question.calculateTotalPage(totalRow, questionPageSize);
		
		
		
		return ""+totalPage;
	}
	
	@RequestMapping("/showHotQuestion.do")
	public @ResponseBody List<Question> showHotQuestion(){
		List<Question> questionlist=null;	
		 questionlist=questionMapper.gethotQuestion();
		 return questionlist;
	}
	
	
	@RequestMapping("/showQuestion.do")
	public @ResponseBody List<Question> showQuestion(String type,String keyword,int page){
		Question question=new Question();
		question.setPageSize(questionPageSize);		
		question.setCurrentPage(page);
		List<Question> questionlist=null;
		
		if(type.equals("all")){
			 questionlist=questionMapper.getQuestionbyPage(question);
		}
		if(type.equals("point")){
			questionlist=questionMapper.getQuestionWithPoint(question);
		}
        if(type.equals("noanswer")){
        	questionlist=questionMapper.getQuestionWithNoAnswer(question);
		}
        if(type.equals("answer")){
        	questionlist=questionMapper.getQuestionHaveAnswer(question);
		}
        
		
		
		return questionlist;
	} 
	
	@RequestMapping("/showDetailQuestion.do")
    public String showDetailQuestion(int questionid,Model model){
		Question question=new Question();
		question.setQuestionid(questionid);
		
		Question resultQuestion=questionMapper.getQuestionbyid(question);		
		questionMapper.updateBrowsenum(question);
		
		model.addAttribute("question", resultQuestion);
		
		Answer answer=new Answer();
		answer.setQuestionid(questionid);
		List<Answer> resultAnswerList=answerMapper.getAnswerbyqid(answer);
		model.addAttribute("answerlist", resultAnswerList);
		
		model.addAttribute("questionid", questionid);
		return "detailQuestion";
	}
	
	@RequestMapping("/addAnswer.do")
	public @ResponseBody String addAnswer(String username,int questionid,String content){
		Answer answer=new Answer();
		answer.setQuestionid(questionid);
		answer.setUsername(username);
		answer.setContent(content);
		
		Question question=new Question();
		question.setQuestionid(questionid);
		questionMapper.updateAnswernum(question);
		
		int result=answerMapper.insertAnswer(answer);
		if(result==1){
			return "1";
		}
		return "0";
	}
	
	@RequestMapping("/addCollectnum.do")
	public @ResponseBody String addCollectnum(String questionid){
		Question question=new Question();
		question.setQuestionid(Integer.parseInt(questionid));
		questionMapper.addCollectnum(question);
		return "1";
	}
	
	@RequestMapping("/delectCollectnum.do")
	public @ResponseBody String delectCollectnum(String questionid){
		Question question=new Question();
		question.setQuestionid(Integer.parseInt(questionid));
		questionMapper.delectCollectnum(question);
		return "1";
	}
	
}
