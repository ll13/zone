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



@Controller
public class AskController {
	
	@Resource(name="questionMapper")
	QuestionMapper questionMapper;
	@Resource(name="answerMapper")
	AnswerMapper answerMapper;
	
	@RequestMapping("/addQuestion.do")
	public @ResponseBody String addQuestion(String user,String title,String questionContent,String question_point){
		Question question=new Question();
		question.setUsername(user);
		question.setTitle(title);
		question.setContent(questionContent);
		question.setPoint(question_point);
		
		
		questionMapper.insertQuestion(question);
		
		return "1";
	}
	
	@RequestMapping("/showQuestion.do")
	public @ResponseBody List<Question> showQuestion(String type,int page){
		//Question question=new Question();
		List<Question> questionlist=questionMapper.getAll();
		
		
		return questionlist;
	} 
	
	@RequestMapping("/showDetailQuestion.do")
    public String showDetailQuestion(int questionid,Model model){
		Question question=new Question();
		question.setQuestionid(questionid);
		Question resultQuestion=questionMapper.getQuestionbyid(question);
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
		int result=answerMapper.insertAnswer(answer);
		if(result==1){
			return "1";
		}
		return "0";
	}
	
	
	
}
