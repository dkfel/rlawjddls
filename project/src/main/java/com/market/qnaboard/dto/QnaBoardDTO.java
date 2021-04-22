package com.market.qnaboard.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("qnaDTO")
public class QnaBoardDTO {
	//field
	private int qa_id; 			//Q&A식별번호	
	private	int member_id;		//회원식별번호
	private	String email;		//email
	private	Date created_at;	//등록일자
	private	String title;		//제목
	private	String content;		//내용
	private	int is_deleted;			//삭제여부 삭제:1 or 정상:0 
	private	int is_locked;			//공개여부 비공개:1 or 공개:0
	
	//constructor
	public QnaBoardDTO() {}
	public QnaBoardDTO(int qa_id, int member_id, String email, Date created_at, String title, String content, int is_deleted,
			int is_locked) {
		super();
		this.qa_id = qa_id;
		this.member_id = member_id;
		this.email = email;
		this.created_at = created_at;
		this.title = title;
		this.content = content;
		this.is_deleted = is_deleted;
		this.is_locked = is_locked;
	}
	
	//method
	public int getQa_id() {
		return qa_id;
	}
	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getIs_locked() {
		return is_locked;
	}
	public void setIs_locked(int is_locked) {
		this.is_locked = is_locked;
	}
	

	
	
	
	
	
	
}