package com.koreait.board2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.board2.common.Utils;
import com.koreait.board2.model.BoardVO;

@WebServlet("/bList")
public class BoardListSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int typ = Utils.getIntParam(request, "typ", 1);	// 값이 있다면 값이 넘어오고 문제가 발생하면 기본으로 1을 받음
		int page = Utils.getIntParam(request, "page", 1);
		System.out.println("typ : " + typ);
		
		BoardVO param = new BoardVO();
		param.setTyp(typ);
		param.setRowCntPerPage(5);
		
		request.setAttribute("pageCnt", BoardService.selPageCnt(param));
		request.setAttribute("typ", typ);
		request.setAttribute("list", BoardService.selBoardList(param, page));
		 
		Utils.forward("리스트", "bList", request, response);
	}

}