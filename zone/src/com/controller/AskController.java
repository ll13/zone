package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.QuestionMapper;
import com.po.Question;



@Controller
public class AskController {
	
	@Resource(name="questionMapper")
	QuestionMapper questionMapper;
	
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
		Question result=questionMapper.getQuestionbyid(question);
		model.addAttribute("question", result);
		return "detailQuestion";
	}
}
