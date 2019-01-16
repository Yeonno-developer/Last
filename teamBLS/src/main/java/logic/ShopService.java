package logic;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.netty.handler.codec.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ItemDao; //Repository
import dao.SaleDao;
import dao.SaleItemDao;
import dao.UserDao;
import exception.ShopException;
import dao.BoardDao;
import dao.CommentDao;
import logic.Item; //Bean

@Service
public class ShopService {
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private CommentDao commentDao;

	public List<Item> getItemList() {
		return itemDao.list();
	}

	public Item getItem(String id) {
		return itemDao.getItem(id);
	}

	public void itemCreate(Item item, HttpServletRequest request) {

		if (item.getPicture() != null && !item.getPicture().isEmpty()) {
			uploadFileCreate(item.getPicture(), request, "picture");

			item.setPictureUrl(item.getPicture().getOriginalFilename());
		}
		itemDao.insert(item);
	}

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/" + path + "/";

		String orgFile = picture.getOriginalFilename();
		try {

			picture.transferTo(new File(uploadPath + orgFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void itemUpdate(Item item, HttpServletRequest request) {
		if (item.getPicture() != null && !item.getPicture().isEmpty()) {
			uploadFileCreate(item.getPicture(), request, "picture");
			item.setPictureUrl(item.getPicture().getOriginalFilename());
		}
		itemDao.update(item);
	}

	public void delete(String id) {
		itemDao.delete(id);
	}

	@Autowired
	private UserDao userdao;

	public void userCreate(User user) {
		userdao.createuser(user);
	}

	public User selectUser(String userId) {
		return userdao.selectuser(userId);
	}

	@Autowired
	private SaleDao saleDao;
	@Autowired
	private SaleItemDao saleItemDao;

	public Sale checkEnd(User loginUser, Cart cart) {
		Sale sale = new Sale();
		sale.setSaleId(saleDao.getMaxSaleId());
		sale.setUser(loginUser);
		sale.setUpdateTime(new Date());

		List<ItemSet> itemList = cart.getItemSetList();

		int i = 0;
		for (ItemSet is : itemList) {
			int saleItemId = ++i;
			SaleItem saleItem = new SaleItem(sale.getSaleId(), saleItemId, is, sale.getUpdateTime());
			sale.getItemList().add(saleItem);
		}
		saleDao.insert(sale);
		List<SaleItem> saleItemList = sale.getItemList();
		for (SaleItem is : saleItemList) {
			saleItemDao.insert(is);
		}
		return sale;
	}

	public List<Sale> getSaleList(String userId) {
		return saleDao.list(userId);
	}

	public List<SaleItem> getSaleItemList(Integer saleId) {
		return saleItemDao.list(saleId);
	}

	public void userUpdate(User user) {
		userdao.update(user);
	}

	public void userDelete(String id) {
		userdao.delete(id);
	}

	public List<User> userList() {
		User user = new User();
		return userdao.userlist();
	}

	public List<User> userList(String[] idchks) {
		return userdao.userList(idchks);
	}

	public Board getBoard(Integer num) {
		return boardDao.select(num);
	}

	public Board getBoard(Integer num, HttpSession session) {
		return boardDao.select(num);
	}

	public int boardcount(String searchType, String searchContent,String tcode) {
		return boardDao.count(searchType, searchContent,tcode);
//	public int boardcount(String searchType, String searchContent) {
//		return boardDao.count(searchType, searchContent);
	}
	
	public int commentcount(int num) {
		return boardDao.commentcount(num);
	}

//	public List<Board> boardlist(String searchType, String searchContent, Integer pageNum, int limit) {
//	return boardDao.list(searchType, searchContent, pageNum, limit);
	public List<Board> boardlist(String searchType, String searchContent, String tcode, Integer pageNum, int limit) {
		return boardDao.list(searchType, searchContent, tcode,pageNum, limit);
	}

	public void boardadd(Board board, HttpServletRequest request) {
		if (board.getFile1() != null && !board.getFile1().isEmpty()) {
			uploadFileCreate(board.getFile1(), request, "file");
			board.setFileurl(board.getFile1().getOriginalFilename());
		}
		int max = boardDao.maxNum();
		board.setNum(++max);
		board.setRef(max);
		boardDao.insert(board);
	}

	public void readcntadd(Integer num) {
		boardDao.readcntadd(num);
	}

	public void replyadd(Board board) {
		Board b1 = boardDao.select(board.getNum()); // 원글정보
		int max = boardDao.maxNum();
		board.setNum(++max);
		board.setRef(b1.getRef());
		board.setReflevel(b1.getReflevel() + 1);
		board.setRefstep(b1.getRefstep() + 1);
		boardDao.refstep(b1); // => 작업 전 기존의 원글의 refstep 보다 큰 모든 레코드들을 refstep+1로 수정하기
		boardDao.insert(board); // 답글 등록
	}

	public void boardupdate(Board board, HttpServletRequest request) {
		if (board.getFile1() != null && !board.getFile1().isEmpty()) {
			uploadFileCreate(board.getFile1(), request, "file");
			board.setFileurl(board.getFile1().getOriginalFilename());
		}
		boardDao.update(board);
	}

	public void boarddelete(int num) {
		boardDao.delete(num);
	}

	public String getHashvalue(String password) {
		MessageDigest md;
		String hashvalue = "";
		try {
			md = MessageDigest.getInstance("SHA-256");
			byte[] plain = password.getBytes();
			byte[] hash = md.digest(plain);
			for (byte b : hash) {
				hashvalue += String.format("%02X", b);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new ShopException("전산부에 전화 요망", "../login.shop");
		}
		return hashvalue;
	}

	public void commregster(Comment comment) {
		int max = commentDao.maxnum();
		comment.setComnum(++max);
		commentDao.commentRegister(comment);
	}

	public List<Item> getItemList_type(String type) {
		return itemDao.typeList(type);
	}

	public int getMaxnum() {
		return itemDao.Maxnum();
	}

	public List<Board> boardreply(int ref, int reflevel) {
		return boardDao.selectR(ref,reflevel);
	}

}
