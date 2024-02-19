package com.model2;

import com.common.DBConnPool;
import com.model1.board.BoardDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends DBConnPool {
    public MVCBoardDAO(){
        super();
    }
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM scott.mvcboard";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchFiled") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";

        }
        //SELECT COUNT(*) FROM board_jsp
        //WHERE title Like '%검색어%';
        //2.조건 반환
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MVCBoard selectCount 오류발생");

        }
        return totalCount;
    }
    //검색조건에 맞는 게시물 목록 반환(페이징ㅇ)
    public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
        //쿼리 결과를 담을 변수
        List<MVCBoardDTO> bbs = new ArrayList<MVCBoardDTO>(); //뒤의 BoardDTO 생략가능

        //쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.mvcboard";

        if(map.get("searchWord") != null){
            query += " WHERE " + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";

        }
        query += " ORDER BY idx desc"
                + " ) Tb"
                + " )"
                +" WHERE rNUM BETWEEN ? AND ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1,map.get("start").toString());
            psmt.setString(2,map.get("end").toString());

            rs=psmt.executeQuery();

            while(rs.next()){
                //한 row의 내용을 DTO에 저장
                MVCBoardDTO dto = new MVCBoardDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));
                bbs.add(dto);

            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("MVCBoard 오류발생");
        }

        return bbs;
    }
    public int insertWrite(MVCBoardDTO dto) {
        int result = 0;

        //쿼리 작성
        try{
            String query = "INSERT INTO scott.mvcboard("
                    + "idx,name,title,content,ofile,sfile,pass)"
                    +" VALUES ("
                    +" scott.seq_board_num.nextval, ?,?,?,?,?,?)";

            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getName());
            psmt.setString(2,dto.getTitle());
            psmt.setString(3,dto.getContent());
            psmt.setString(4,dto.getOfile());
            psmt.setString(5,dto.getSfile());
            psmt.setString(6,dto.getPass());

            result = psmt.executeUpdate();


        }catch(Exception e){
            e.printStackTrace();
            System.out.println("mvcboard insertWrite 오류발생");

        }

        return result;
    }

    //파라메터 idx 값에 따라 게시물 가져오기
    public MVCBoardDTO selectView(String idx) {
        MVCBoardDTO dto = new MVCBoardDTO();

        //쿼리 작성
        String query = "SELECT * FROM scott.mvcboard WHERE idx =?";

        try {
            psmt =con.prepareStatement(query);
            psmt.setString(1,idx);
            rs = psmt.executeQuery();

            if(rs.next()) {
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));

            }


        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("mvcboard selectView 오류발생");
        }

        return dto;
        }

        //입력한 비밀번호가 지정한 idx 게시물의 비밀번호와 일치하는지 여부 확인
        public boolean confirmPassword(String pass, String idx) {
            boolean isCorr = true;
            String query = "SELECT COUNT(*) FROM scott.mvcboard WHERE pass=? AND idx=? ";
            try {
                psmt = con.prepareStatement(query);
                psmt.setString(1, pass);
                psmt.setString(2, idx);
                rs = psmt.executeQuery();
                rs.next();
                if(rs.getInt(1) == 0) {
                    isCorr = false;
                }

            } catch (Exception e) {
                isCorr=false;
                System.out.println("confirmPassword 오류발생");
                e.printStackTrace();
            }
            return isCorr;
        }

        //게시글 수정
        public int updatePost(MVCBoardDTO dto) {
            int result = 0;
            String query = "UPDATE scott.mvcboard "
                    +" SET title =?, name =?,content =?, ofile=?, sfile=?"
                    +" WHERE idx=? AND pass=?";
            try {
                psmt=con.prepareStatement(query);
                psmt.setString(1,dto.getTitle());
                psmt.setString(2,dto.getName());
                psmt.setString(3,dto.getContent());
                psmt.setString(4,dto.getOfile());
                psmt.setString(5,dto.getSfile());
                psmt.setString(6,dto.getIdx());
                psmt.setString(7,dto.getPass());

                result = psmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("updatePost 오류발생");
            }
            return result;
        }

        public void updateVisitCount(String idx){
            String query = "UPDATE scott.mvcboard "
                    +" SET visitcount = visitcount + 1"
                    +" WHERE idx =? ";
            try{
                psmt =con.prepareStatement(query);
                psmt.setString(1,idx);
                psmt.executeQuery();

            }catch(Exception e) {
                e.printStackTrace();
                System.out.println("mvcboard updateViewCount 오류발생");
            }
        }


    public void updateDownCount(String idx){
        String query = "UPDATE scott.mvcboard"
                +" SET downcount = downcount + 1"
                +" WHERE idx = ?";
        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1,idx);
            psmt.executeUpdate();
    }catch (Exception e){
        e.printStackTrace();
        System.out.println("updateDownCount 오류발생");}
    }
    public int deletePost(String idx){
        int result = 0;
        //안지워졌으면 0 지워졌으면 1??
        String query = "DELETE FROM scott.mvcboard WHERE idx =?";
        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1,idx);
            result = psmt.executeUpdate();

        }catch(Exception e) {
            e.printStackTrace();
            System.out.println("deletePost 오류발생");
        }
        return result;
    }
}


























