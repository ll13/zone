package com.mapper;

import java.util.List;


import com.po.Reply;

public interface ReplyMapper {
	public  int insertReply(Reply reply);
    public  List<Reply> getReplybyqid(Reply reply);
}
