package com.koreait.board2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.board2.common.Utils;
import com.koreait.board2.db.BoardDAO;
import com.koreait.board2.model.BoardVO;


@WebServlet("/bDetail")
public class BoardDetailSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int typ = Utils.getIntParam(request, "typ");
		int i_board = Utils.getIntParam(request, "i_board");
		
		if(typ == 0 || i_board == 0) {
			Utils.forwardErr(request, response);
			return;
		}
		
		BoardVO param = new BoardVO();
		param.setTyp(typ);
		param.setI_board(i_board);
		
		BoardVO data = BoardService.detail(param, request);
		request.setAttribute("data", data);
		request.setAttribute("cmtList", BoardService.selBoardCmtList(param));
		Utils.forward(data.getTitle(), "bDetail", request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int i_board = Utils.getIntParam(request, "i_board");
		int typ = Utils.getIntParam(request, "typ");
	
		BoardVO param = new BoardVO();
		param.setI_board(i_board);
		param.setTyp(typ);
		
		int result = BoardService.delBoard(param);
		
		if(result == 0)
		{
			request.setAttribute("msg", "삭제할 수 없습니다.");
			doGet(request, response);
			return;
		}
		response.sendRedirect("/bList?typ="+typ);
	}

}
