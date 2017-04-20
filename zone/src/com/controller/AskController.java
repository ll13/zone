package com.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.QuestionMapper;
import com.mapper.UserMapper;
import com.po.Question;
import com.po.User;


@Controller
public class AskController {
	
	@Resource(name="questionMapper")
	QuestionMapper questionMapper;
	
	@RequestMapping("/addQuestion.do")
	public @ResponseBody String register(String user,String title,String questionContent,String question_point){
		Question question=new Question();
		question.setUsername(user);
		question.setTitle(title);
		question.setContent(questionContent);
		question.setPoint(question_point);
		
		
		questionMapper.insertQuestion(question);
		
		return "1";
	}

}
