package com.model2;

import com.fileupload.FileUtil;
import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/mvcboard/edit.do")
@MultipartConfig(
        maxFileSize = 1024*1024*1,
        maxRequestSize = 1024*1024*10)

public class EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
   public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idx = req.getParameter("idx");
        MVCBoardDAO dao = new MVCBoardDAO();
        MVCBoardDTO dto = dao.selectView(idx);
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/14/Edit.jsp").forward(req,resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //파일업로드 처리
        String sDir = req.getServletContext().getRealPath("/Uploads");

        //파일 업로드
        String oFileName = "";
        try {
            oFileName = FileUtil.uploadFile(req,sDir);

        }catch (Exception e) {
            e.printStackTrace();
            JSFunction.alertBack(resp, "파일 업로드 오류");
            return;
        }

        //DB에  update입력
        String idx = req.getParameter("idx");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");
        System.out.println("이전 파일 확인" + prevSfile + " :: " + prevOfile);
        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        System.out.println("파일 외 확인 : " + title + " : " + content);
        HttpSession session = req.getSession();
        String pass = (String) session.getAttribute("pass");
        System.out.println("세션에서 받아온 pass : " + pass);
        //DTO에 저장
        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setIdx(idx);
        dto.setName(name);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setPass(pass);

        System.out.println("ofile 확인 : " + oFileName);
         //원본 파일 명과 저장된 파일 명 이름 설정
        if(oFileName != ""){ //신규로 파일 등록한 경우
            System.out.println("신규로 파일 등록");
            String sFileName = FileUtil.renameFile(sDir,oFileName);
            dto.setOfile(oFileName);
            dto.setSfile(sFileName);
            FileUtil.deleteFile(req,"/Uploads", prevSfile);  // 기존 파일 삭제

        } else { // 첨부파일이 없는 경우 (기존파일 유지)
            System.out.println("기존 파일 유지" +prevOfile + prevSfile);
            dto.setSfile(prevSfile);
            dto.setOfile(prevOfile);

        }

        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.updatePost(dto);
        dao.close();
        System.out.println(result);
        if (result==1){
            session.removeAttribute("pass");
            resp.sendRedirect("../mvcboard/view.do?idx="+idx);
        }else{
            JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요",
                    "../mvcboard/view.do?idx="+idx);
        }

    }
}
