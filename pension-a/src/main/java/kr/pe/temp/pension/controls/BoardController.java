package kr.pe.temp.pension.controls;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import kr.pe.temp.pension.dao.BoardDao;
import kr.pe.temp.pension.util.DetectDeviceUtils;
import kr.pe.temp.pension.util.PagingUtils;
import kr.pe.temp.pension.util.UploadFileUtils;
import kr.pe.temp.pension.vo.Board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

//@SessionAttributes ?��?��
@Controller
@RequestMapping(value = "/Board")
public class BoardController {

	BoardDao boardDao;
	@Resource(name = "pagingUtils")
	PagingUtils pagingUtils;

	@Resource(name = "detectDeviceUtils")
	DetectDeviceUtils detectDeviceUtils;

	@Resource(name = "uploadFileUtils")
	UploadFileUtils uploadFileUtils;

	@Autowired
	public BoardController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}

	@RequestMapping(value = "/list", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getform(@RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {

		int totalCount = boardDao.selectTotalCount(String.valueOf(param
				.get("type")));
		int currentPage = 1;
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		int totalPage = pagingUtils.getTotalPage(totalCount);
		int beginIndex = pagingUtils.getBeginIndex(currentPage);
		int endIndex = pagingUtils.getEndIndex();
		int current = (currentPage - 1) / 10;
		int total = totalPage / 10;
		param.put("beginIndex", beginIndex);
		List<Board> boardList = boardDao.selectList(param);
		model.put("totalCount", totalCount);
		model.put("currentPage", currentPage);
		model.put("totalPage", totalPage);
		model.put("boardlist", boardList);

		model.put("current", current);
		model.put("total", total);

		model.put("type", param.get("type"));

		return "list.jsp";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String getread(Board board, @RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {
		boardDao.updateCount(board.getNum());
		model.put("board", boardDao.selectBoard(Integer.parseInt((String) param
				.get("num"))));
		model.put("type", param.get("type"));
		int currentPage = Integer.valueOf((String) param.get("currentPage"));
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);

		// 댓글
		int totalCount = boardDao.selectCoTotalCount(Integer
				.parseInt((String) param.get("num")));
		int coCurrentPage = 1;
		if (param.get("coCurrentPage") != null)
			coCurrentPage = Integer.valueOf(param.get("coCurrentPage")
					.toString());
		int coTotalPage = pagingUtils.getTotalPage(totalCount);
		int beginIndex = pagingUtils.getBeginIndex(coCurrentPage);
		int endIndex = pagingUtils.getEndIndex();
		int current = (coCurrentPage - 1) / 10;
		int total = coTotalPage / 10;
		param.put("beginIndex", beginIndex);
		List<Board> commantList = boardDao.selectCoList(param);

		model.put("totalCount", totalCount);
		model.put("coCurrentPage", coCurrentPage);
		model.put("coTotalPage", coTotalPage);
		model.put("current", current);
		model.put("total", total);

		model.put("commantList", commantList);
		return "read.jsp";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String del(Board board, @RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {
		boardDao.deleteBoard(board);
		model.put("type", board.getBsection());
		return "redirect:list.temp";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(String type, @RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {
		model.put("type", type);
		int currentPage = Integer.valueOf((String) param.get("currentPage"));
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);
		return "add.jsp";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String adda(Board board, @RequestParam MultipartFile img,
			Device device) throws Exception {
		if (!img.isEmpty()) {
			board.setPic(uploadFileUtils.saveUploadFile(img));
			board.setPictype(detectDeviceUtils.getDeviceType(device));
		}
		boardDao.insertBoard(board);
		return "list.temp?type=" + board.getBsection();
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Board board, @RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {
		model.put("board", boardDao.udtselectBoard(board));
		model.put("num", board.getNum());
		model.put("type", board.getBsection());

		int currentPage = Integer.parseInt((String) param.get("currentPage"));
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);
		return "update.jsp";
	}

	@RequestMapping(value = "/updateSuc", method = RequestMethod.POST)
	public String updateSuc(Board board, @RequestParam MultipartFile img,
			@RequestParam Map<String, Object> param, Device device,
			Map<String, Object> model) throws Exception {
		if (!img.isEmpty()) {
			board.setPic(uploadFileUtils.saveUploadFile(img));
			board.setPictype(detectDeviceUtils.getDeviceType(device));
		}

		int currentPage = Integer.valueOf((String) param.get("currentPage"));
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);
		model.put("num", board.getNum());
		model.put("type", board.getBsection());
		boardDao.updateBoard(board);

		return "redirect:read.temp";
	}

	// 댓글
	@RequestMapping(value = "/coAdd", method = RequestMethod.POST)
	public String coAdd(Board board, @RequestParam Map<String, Object> param,
			Device device, Map<String, Object> model) throws Exception {
		int currentPage = Integer.valueOf((String) param.get("currentPage"));
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);
		model.put("type", param.get("type"));
		model.put("num", board.getNum());
		boardDao.insertComment(board);
		return "redirect:read.temp";
	}

	@RequestMapping(value = "/coDel", method = RequestMethod.POST)
	public String coDel(Board board, @RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {
		boardDao.deleteComment(board);
		int currentPage = Integer.valueOf((String) param.get("currentPage"));
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);
		model.put("type", param.get("type"));
		model.put("num", board.getNum());

		return "redirect:read.temp";
	}

	@RequestMapping(value = "/coUdtSelect", method = RequestMethod.POST)
	public @ResponseBody Board coUdtSelect(@RequestBody Board board
			 )
			throws Exception {
		System.out.println(board);

		
		/*int currentPage = Integer.valueOf((String) param.get("currentPage"));*/
		/*if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);
		model.put("type", param.get("type"));
		model.put("num", board.getNum());
		model.put("cnum", board.getCnum());*/
		board=boardDao.udtCommentSelect(board);
		return board;
	}

	@RequestMapping(value = "/coUdt", method = RequestMethod.POST)
	public String coUdt(Board board, @RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {

		boardDao.updateComment(board);
		int currentPage = Integer.valueOf((String) param.get("currentPage"));
		if (param.get("currentPage") != null)
			currentPage = Integer.valueOf(param.get("currentPage").toString());
		model.put("currentPage", currentPage);
		model.put("type", param.get("type"));
		model.put("num", board.getNum());
		
		return "redirect:read.temp";
	}

}
