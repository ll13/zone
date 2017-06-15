package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.AnswerMapper;
import com.mapper.QuestionCollectMapper;
import com.mapper.QuestionMapper;
import com.po.Answer;
import com.po.Question;
import com.po.QuestionCollect;
import com.service.PointService;
import com.util.Cache;



@Controller
public class AskController {
	
	@Resource(name="questionMapper")
	QuestionMapper questionMapper;
	@Resource(name="answerMapper")
	AnswerMapper answerMapper;
	@Resource(name="questionCollectMapper")
	QuestionCollectMapper questionCollectMapper;
	@Resource(name="pointServiceImpl")
	PointService pointService;
	
	int questionPageSize=3;
	
	
	
	@RequestMapping("/addQuestion.do")
	public @ResponseBody String addQuestion(String user,String title,String questionContent,String question_point){
		Question question=new Question();
		question.setUsername(user);
		question.setTitle(title);
		question.setContent(questionContent);
		question.setPoint(question_point);
		
		boolean flag=pointService.reducePoint(user, Integer.parseInt(question_point), "悬赏问题");
		if(flag){
			questionMapper.insertQuestion(question);
			String questionid=questionMapper.getIdbyTitle(question)+"";
			return questionid;
		}else{
			return "fail";
		}
           
	}
	
	@RequestMapping("/getQuestionTotalPage.do")
	public @ResponseBody String getQuestionTotalPage(String type,String username,String keyword){
		
		 int totalRow=0;		 
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
		 if(type.equals("myquestion")){
			 Question q=new Question();
			 q.setUsername(username);
			 totalRow=questionMapper.getQuestionTotalRowMyquestion(q);
		 }
		 if(type.equals("collect")){
			 Question q=new Question();
			 q.setUsername(username);
			 totalRow=questionMapper.getMyCollectQuestionTotalRow(q);
				
		 }
		 if(type.equals("keyword")){
			 Question q=new Question();
			 q.setTitle("%"+keyword+"%");
			 totalRow=questionMapper.getQuestionKeywordTotalRow(q);
				
			}
		 questionPage.setTotalRow(totalRow);		
		 int totalPage=Question.calculateTotalPage(totalRow, questionPageSize);
		
		return ""+totalPage;
	}
	
	@RequestMapping("/showHotQuestion.do")
	public @ResponseBody List<Question> showHotQuestion(){
		List<Question> questionlist=null;	
		 questionlist=questionMapper.gethotQuestion();
		 return questionlist;
	}
	
	@RequestMapping("/showNewQuestion.do")
	public @ResponseBody List<Question> showNewQuestion(){
		
		
		List<Question> questionlist=null;	
		 questionlist=questionMapper.getNewQuestion();
		 return questionlist;
	}
	
	
	@RequestMapping("/showQuestion.do")
	public @ResponseBody List<Question> showQuestion(String type,String keyword,int page,String username){
		Question question=new Question();
		question.setPageSize(questionPageSize);		
		question.setCurrentPage(page);
		List<Question> questionlist=null;
		
		
		if(type.equals("all")&&page==1){
			Cache cache=Cache.getInstance();
			 questionlist=(List<Question>)cache.getElementbyKey("questionlist");
			 if(questionlist==null){
			 questionlist=questionMapper.getQuestionbyPage(question);
			 cache.putElementbyKey("questionlist", questionlist);
			 }			 
		}if(type.equals("all")&&page>1){
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
        if(type.equals("myquestion")){
        	question.setUsername(username);
        	questionlist=questionMapper.getQuestionbyUsername(question);
		}if(type.equals("collect")){
			question.setUsername(username);
			questionlist=questionMapper.getMyCollectQuestion(question);
			
		}if(type.equals("keyword")){
			question.setTitle("%"+keyword+"%");
			questionlist=questionMapper.getQuestionbyKeyword(question);
			
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
		
		if(resultQuestion.getHaveright()==1){
			for(int i=0;i<resultAnswerList.size();i++){
				if(resultAnswerList.get(i).getIsright()==1){
					model.addAttribute("rightAnswer", resultAnswerList.get(i));
					resultAnswerList.remove(i);
					break;
				}
			}
		}
		
		
		
		model.addAttribute("answerlist", resultAnswerList);		
		model.addAttribute("questionid", questionid);
		return "detailQuestion";
	}
	
	@RequestMapping("/checkCollect.do")
	public @ResponseBody String checkCollect(String username,int questionid){
		QuestionCollect questionCollect=new QuestionCollect();
		questionCollect.setQuestionid(questionid);
		questionCollect.setUsername(username);
		QuestionCollect qc=questionCollectMapper.checkCollect(questionCollect);
		if(qc!=null){
			return "1";
		}
		return "0";
		
		
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
		
		answerMapper.insertAnswer(answer);
		int result=answerMapper.getAnsweridbyAnswer(answer);
		
		return result+"";
	}
	
	@RequestMapping("/addCollectnum.do")
	public @ResponseBody String addCollectnum(String questionid,String username){
		Question question=new Question();
		question.setQuestionid(Integer.parseInt(questionid));
		questionMapper.addCollectnum(question);
		
		QuestionCollect qc=new QuestionCollect();
		qc.setQuestionid(Integer.parseInt(questionid));
		qc.setUsername(username);
		questionCollectMapper.insertQuestionCollect(qc);
		
		
		return "1";
	}
	
	@RequestMapping("/delectCollectnum.do")
	public @ResponseBody String delectCollectnum(String questionid,String username){
		Question question=new Question();
		question.setQuestionid(Integer.parseInt(questionid));
		questionMapper.delectCollectnum(question);
		
		QuestionCollect qc=new QuestionCollect();
		qc.setQuestionid(Integer.parseInt(questionid));
		qc.setUsername(username);
		questionCollectMapper.delectQuestionCollect(qc);
		return "1";
	}
	
	@RequestMapping("/updateQuestion.do")
	public @ResponseBody String updateQuestion(String questionid,String title,String content,String point,String username){
		Question question=new Question();
		question.setQuestionid(Integer.parseInt(questionid));
		question.setTitle(title);
		question.setContent(content);
		question.setPoint(point);
	
		boolean flag=pointService.reducePoint(username, Integer.parseInt(point), "悬赏问题");
		if(flag){
			questionMapper.updateQuestionbyquestionid(question);
			return "1";
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping("/addPointbyAnswer.do")
	public @ResponseBody String addPointbyAnswer(String username,String point,String questionid,String answerid){
		point=point.trim();
		username=username.trim();
		answerid=answerid.trim();
		pointService.addPoint(username, Integer.parseInt(point), "回答问题被采纳");
		
		Question question=new Question();
		question.setQuestionid(Integer.parseInt(questionid));
		question.setHaveright(1);
		questionMapper.updateQuestionRightAnswer(question);
		
		Answer answer=new Answer();
		answer.setIsright(1);
		answer.setAnswerid(Integer.parseInt(answerid));
		answerMapper.updateAnswerRight(answer);
		
		return questionid;
		
		
	}
	
	@RequestMapping("/delectQuestion.do")
	public @ResponseBody String delectQuestion(String questionid){
		Question question=new Question();
		question.setQuestionid(Integer.parseInt(questionid));
		questionMapper.delectQuestionbyquestionid(question);
		return "1";
	}
	
	
	
}
