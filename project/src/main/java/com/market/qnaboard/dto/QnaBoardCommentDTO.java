package com.market.qnaboard.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("qnaCommentDTO")
public class QnaBoardCommentDTO {
	//field
		private int qa_comment_id; 	//Q&A답변식별번호	
		private	int qa_id;			//Q&A식별번호	
		private	int member_id;	//회원식별번호
		private String email;		//이메일
		private	Date created_at;	//등록일자
		private	String content;		//내용
		private	int is_deleted;			//삭제여부 1 or 0 
		
		
		//constructor
		public QnaBoardCommentDTO() {}
		public QnaBoardCommentDTO(int qa_comment_id, int qa_id, int member_id, String email, Date created_at,
				String content, int is_deleted) {
			this.qa_comment_id = qa_comment_id;
			this.qa_id = qa_id;
			this.member_id = member_id;
			this.email = email;
			this.created_at = created_at;
			this.content = content;
			this.is_deleted = is_deleted;
		}
		
		
		//method
		
		public int getQa_comment_id() {
			return qa_comment_id;
		}
		public void setQa_comment_id(int qa_comment_id) {
			this.qa_comment_id = qa_comment_id;
		}
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
		@Override
		public String toString() {
			return "QnaBoardCommentDTO [qa_comment_id=" + qa_comment_id + ", qa_id=" + qa_id + ", member_id="
					+ member_id + ", email=" + email + ", created_at=" + created_at + ", content=" + content
					+ ", is_deleted=" + is_deleted + "]";
		}

		
		
		
}
