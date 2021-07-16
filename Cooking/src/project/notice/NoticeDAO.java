package project.notice;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import project.notice.NoticeDTO;

public class NoticeDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public NoticeDAO() {
			
	}
	//메인 공지사항 목록 보기
	public ArrayList<NoticeDTO> Main_noticeList(){
			try{
					conn=pro.db.ProDB.getConn();
			
					String sql="select * from "+
									"(select rownum as rnum,a. * from "+
									"(select * from notice order by notice_idx desc)a)b";
				
					ps=conn.prepareStatement(sql);
				
					rs=ps.executeQuery();
				
					ArrayList<NoticeDTO>  notice_list=new ArrayList<NoticeDTO>();
				 
					while(rs.next()){
						 int n_idx=rs.getInt("notice_idx");
						 String n_title=rs.getString("notice_title");
						 String n_writer=rs.getString("notice_writer");
						 java.sql.Date n_date=rs.getDate("notice_date");
						 int  n_readnum=rs.getInt("notice_readnum");
						 String n_content=rs.getString("notice_content");
					 
						 NoticeDTO n_dto=new NoticeDTO(n_idx, n_title, n_writer, n_date, n_readnum,n_content);
						 notice_list.add(n_dto);
					}
					return notice_list;
		 
			}catch(Exception e){
				e.printStackTrace();
				return null ;						
			}finally{
				try{
						if(rs!=null)rs.close();
						if(ps!=null)ps.close();
						if(conn!=null)conn.close(); 				
				}catch(Exception e2){}				
		}		
	}
	//공지사항 글작성 메소드
	public int notice_write(String title,String content){
		try{
				conn=pro.db.ProDB.getConn();
			
				String sql="INSERT INTO notice VALUES(notice_notice_idx.nextval,?,'관리자',?,SYSDATE,0)";
			
				ps=conn.prepareStatement(sql);
				
				ps.setString(1, title);
				ps.setString(2, content);
			
				int count=ps.executeUpdate();
				
				if(count>0){
					return count;
				}else{
					return -1;
				}
		
		}catch(Exception e){
			e.printStackTrace();
			return -1;			
			
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close(); 				
			}catch(Exception e2){}				
		}
	}
	//공지사항 목록 보기
	public ArrayList<NoticeDTO> noticeList(int cp,int listSize){
			try{
					conn=pro.db.ProDB.getConn();
			
					String sql="select * from "+
									"(select rownum as rnum,a. * from "+
									"(select * from notice order by notice_idx desc)a)b"+
									" where rnum>=("+cp+"-1)*"+listSize+"+1 and rnum<="+cp+"*"+listSize+"";
				
					ps=conn.prepareStatement(sql);
				
					rs=ps.executeQuery();
				
					ArrayList<NoticeDTO>  notice_list=new ArrayList<NoticeDTO>();
				 
					while(rs.next()){
						 int n_idx=rs.getInt("notice_idx");
						 String n_title=rs.getString("notice_title");
						 String n_writer=rs.getString("notice_writer");
						 java.sql.Date n_date=rs.getDate("notice_date");
						 int  n_readnum=rs.getInt("notice_readnum");
						 String n_content=rs.getString("notice_content");
					 
						 NoticeDTO n_dto=new NoticeDTO(n_idx, n_title, n_writer, n_date, n_readnum,n_content);
						 notice_list.add(n_dto);
					}
					return notice_list;
		 
			}catch(Exception e){
				e.printStackTrace();
				return null ;						
			}finally{
				try{
						if(rs!=null)rs.close();
						if(ps!=null)ps.close();
						if(conn!=null)conn.close(); 				
				}catch(Exception e2){}				
		}		
	}
	//총 게시물 수 관련 메서드
	   public int getTotalCnt(){
	      try{
		         conn=pro.db.ProDB.getConn();
		         
		         String sql="select count(*) from notice";
		         
		         ps=conn.prepareStatement(sql);
		         
		         rs=ps.executeQuery();
		         
		         rs.next();
		         int count=rs.getInt(1);
		         return count==0?1:count;
	         
	         
	      }catch(Exception e){
	         e.printStackTrace();
	         return 1;            //1로 돌려주는 이유: 게시글이 없을 경우도 나와야되니깐 
	      }finally{
	         try{
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(conn!=null)conn.close();                     
	         }catch(Exception e2){         
	         }
	      }
	   }
	   //공지사항 내용 보기
	   public NoticeDTO noticeContent(int notice_idx){
		   
		   try{
			   
			   conn=pro.db.ProDB.getConn();
			   
			   String sql="SELECT * from notice where notice_idx="+notice_idx+"";
			   
			   ps=conn.prepareStatement(sql);
			   
			   rs=ps.executeQuery();
			   
			   if(rs.next()){
				   String notice_title=rs.getString("notice_title");
				   java.sql.Date notice_date=rs.getDate("notice_date");
				   String notice_writer=rs.getString("notice_writer");
				   int notice_readnum=rs.getInt("notice_readnum")+1;
				   	
				   		notice_readnum_count(notice_idx,notice_readnum);
				   		
				   String notice_content=rs.getString("notice_content");
				   
				   NoticeDTO n_dto_view=new NoticeDTO(notice_idx,notice_title,notice_writer,notice_date,notice_readnum,notice_content);
				   
				   return n_dto_view;
			   }else{
				   return null;
			   }
			   
		   }catch(Exception e){
					e.printStackTrace();
					return null;	   
		   }finally{
			   try{
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();				
						   
			   }catch(Exception e2){
				   
			   }
		   }
		   
	   }
	   //공지사항 조회수 
	   public void notice_readnum_count(int idx,int readnum){
		   try{
			   	conn=pro.db.ProDB.getConn();
			   	
			   	String sql="UPDATE notice set notice_readnum=? where notice_idx=?";
			   	
			   	ps=conn.prepareStatement(sql);
			   	
			   	ps.setInt(1, readnum);
			   	ps.setInt(2, idx);
			   	
			   	ps.executeUpdate();
			   	
		   }catch(Exception e){
			   	e.printStackTrace();
		   }finally{
				try{					
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();				
					
				}catch(Exception e2){			
				}
		   }
	   }
	   //공지사항 삭제
	   public int notice_delete(int idx){
		   try{
			   conn=pro.db.ProDB.getConn();
			   
			   String sql="DELETE FROM notice WHERE notice_idx=?";
			   
			   ps=conn.prepareStatement(sql);
			   
			   ps.setInt(1, idx);
			   
			   int count=ps.executeUpdate();
			   
			   return count;
			   
		   }catch(Exception e){
				e.printStackTrace();
				return -1;	   
		   }finally{
			   try{
					
					if(ps!=null)ps.close();
					if(conn!=null)conn.close(); 
			   }catch(Exception e2){}
			   
		   }
	   }
	   //공지사항 수정
	   public int notice_update(int idx,String title,String content){
		   try{
			   conn=pro.db.ProDB.getConn();
			   
			   String sql="UPDATE notice set notice_title=?,notice_content=?, notice_date=SYSDATE where notice_idx=?";
			   
			   ps=conn.prepareStatement(sql);
			   
			   ps.setString(1, title);
			   ps.setString(2, content);
			   ps.setInt(3, idx);
			   
			   int count=ps.executeUpdate();
			   
			   
			   return count;
			   
			   
		   }catch(Exception e){
			   e.printStackTrace();
			   return -1;
		   }finally{
			   try{
				    if(ps!=null)ps.close();
					if(conn!=null)conn.close();  
			   }catch(Exception e){}  
		   }
	   }
	   //윗글 아랫글
	   public ArrayList<Integer> notice_up_down(int idx){
		   try{
			   conn=pro.db.ProDB.getConn();
			   
			   String sql="select notice_idx from "+
						  " (select rownum as rnum,a. * from((select * from notice order by notice_idx desc)a)) "+
						  "where rnum BETWEEN "+
						  " (select rnum from(select rownum as rnum,a. * from((select * from notice order by notice_idx desc)a))where notice_idx=?)-1"+
						  " AND (select rnum from(select rownum as rnum,a. * from((select * from notice order by notice_idx desc)a))where notice_idx=?)+1";
			   		   
			   ps=conn.prepareStatement(sql);
			   
			   ps.setInt(1,idx);
			   ps.setInt(2,idx);
			   		   
			   rs=ps.executeQuery();
			   
			   ArrayList<Integer> notice_idx_up_down_list=new ArrayList<Integer>();
			   
			   while(rs.next()){
				   int notice_idx=rs.getInt("notice_idx");
				   notice_idx_up_down_list.add(notice_idx);
			   }
			   return notice_idx_up_down_list;
   
		   }catch(Exception e){
			   e.printStackTrace();
			   return null;
		   }finally{
			   try{
				   	if(rs!=null)rs.close();
				    if(ps!=null)ps.close();
					if(conn!=null)conn.close();  				  
			   }catch(Exception e2){
				   
			   }
		   }
	   }
	
}
