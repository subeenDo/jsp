package com.membership;


import com.common.DBConnPool;

public class MemberDAO extends DBConnPool {
    //설정한 데이터에스로의 연결이 완료된 MemberDAO 객체를 생성

    public MemberDAO() {
        super();
    }

    //CRUD

    //받아온 파리미터로 아이디/패스워드 일치하는 회원정보 반환
    public MemberDTO getMemberDTO(String uid, String upass) { //반환 값
        MemberDTO dto = new MemberDTO();
        String sql = "SELECT * FROM scott.member_jsp WHERE id =? AND pass =?";

        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, uid);
            psmt.setString(2, upass); //파라미터에 담기
            rs = psmt.executeQuery(); //result에 담기

            while(rs.next()) {
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setRegidate(rs.getString("regidate"));
            }
            System.out.println("getMemberDTO 확인 : "+dto.getName() + dto.getId()); //오류 추적과정 2 DAO에서도 잘 작동되는지
        }catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }


}
