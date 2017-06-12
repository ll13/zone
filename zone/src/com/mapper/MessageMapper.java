package com.mapper;

import java.util.List;

import com.po.Message;

public interface MessageMapper {
	public int insertMessage(Message message);
	public int deleteMessage(Message message);
	public List<Message> getMessagebysend(Message message);
	public List<Message> getMessagebyrecieve(Message message);

}
