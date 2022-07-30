package com.withtrip.WithTrip.goods.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.common.PaginationGoods;
import com.withtrip.WithTrip.goods.model.exception.GoodsException;
import com.withtrip.WithTrip.goods.model.service.GoodsService;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.goods.model.vo.PageInfo;
import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.member.model.vo.Member;


@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService gService;
	
	
	// 여행용품 리스트 조회
	@RequestMapping("glist.go")
	private ModelAndView goodsList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws GoodsException {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getListCount();

		PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
		
	    ArrayList<Goods> gList = gService.selectGList(pi);
	   
	    if(gList != null) {
		    mv.addObject("gList", gList);
		    mv.addObject("pi", pi);
		    mv.addObject("listCount", listCount);
		    mv.setViewName("goodsList");
	    } else {
		    throw new GoodsException("게시글 전체 조회에 실패하였습니다.");
	    }
	    
	    return mv;
	}
	 
	
	// 용품 게시판 글작성 페이지로 이동
    @RequestMapping("goodsWriteForm.go")
    public String goodswriteForm() {
	   
    	return "goodsWriteForm";
    
    }	
	
    
	// 용품 게시글 작성
	@RequestMapping("ginsert.go")
	public String goodsInsert(@ModelAttribute Goods g, @RequestParam("fileNm") List<MultipartFile> files, HttpServletRequest request) throws GoodsException {
		
		ArrayList<Attachment> fileList = new ArrayList<Attachment>();
		for(int i = 0; i < files.size(); i++) {
			if(files.get(i) != null && !files.get(i).isEmpty()) {
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\guploadFiles";
				
				String changeName = saveFile(files.get(i), savePath);
				
				Attachment a = new Attachment();
				
				a.setOriginName(files.get(i).getOriginalFilename());
				a.setChangeName(changeName);
				a.setFilePath(savePath);
				
				if(files.get(i) == files.get(0)) {
					a.setFileLevel(0);
					
				} else {
					a.setFileLevel(1);
				}
				
				fileList.add(a);	
			}
		}
		
		int result = gService.insertGoods(g, fileList);
		
		if(result == fileList.size() + 1) { // fileList의 사진 모두 첨부 + 글 업로드
			return "redirect:glist.go";
		} else {
			throw new GoodsException("게시글 등록에 실패하였습니다.");
		}
		
	}
	
	
	// 용품 게시글 상세보기
    @RequestMapping("gdetail.go")
    public ModelAndView goodsDetail(@RequestParam("gId") int gId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws GoodsException {
      
      Goods goods = gService.selectGoods(gId);
      ArrayList<Attachment> fList = gService.selectFiles(gId);
      
      if(goods != null) {
          if(page != null) {
             mv.addObject("g", goods).addObject("fList", fList).addObject("page", page).setViewName("goods_detail");
          } else if (page == null) {
             mv.addObject("g", goods).addObject("fList", fList).setViewName("goods_detail");
          }
       } else {
          throw new GoodsException("게시글 상세조회에 실패하였습니다.");
       }
      
       return mv;
    }
	
    
	// 용품 게시글 수정 페이지로 이동
	@RequestMapping("gupView.go")
	public String goodsUpdateForm(@ModelAttribute Goods g, @RequestParam("page") int page, @RequestParam("originName") String[] originName, 
							  @RequestParam("changeName") String[] changeName ,Model model) {
		
		ArrayList<Attachment> fileList = new ArrayList<>();
		
		for(int i = 0; i < changeName.length; i++) {
			Attachment a = new Attachment();
			a.setOriginName(originName[i]);
			a.setChangeName(changeName[i]);
			
			fileList.add(a);
		}
		
		model.addAttribute("goods", g).addAttribute("page", page).addAttribute("fileList", fileList);
		
		return "goodsUpdateForm";
	}
	

	// 용품 게시글 수정
	@RequestMapping("gupdate.go")
	public String updateGoods(@ModelAttribute Goods g, @RequestParam("page") int page, @RequestParam("originalFile") String[] originalFile,
							  @RequestParam("reUploadFiles") List<MultipartFile> reUploadFiles, HttpServletRequest request, Model model) throws GoodsException {
		
		ArrayList<Attachment> fileList = new ArrayList<Attachment>();
	 	
		for(int i = 0; i < reUploadFiles.size(); i++) {  
			if(reUploadFiles.get(i) != null && !reUploadFiles.get(i).isEmpty()) {  // 새로운 파일 업로드 하고
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\guploadFiles";
				
				// 기존 파일 삭제(updateForm에서 기존 파일의 name을 originFile로 같게 넘겨서 배열로 받아옴)
				if(originalFile[i] != null) {
					deleteFile(originalFile[i], savePath);
				}
				
				// 새로운 파일 업로드
				String changeName = saveFile(reUploadFiles.get(i), savePath);
				
				Attachment a = new Attachment();
				
				a.setOriginName(reUploadFiles.get(i).getOriginalFilename());
				a.setChangeName(changeName);
				a.setFilePath(savePath);
				a.setBoardId(g.getGoodsId());
				
				if(reUploadFiles.get(i) == reUploadFiles.get(0)) {
					a.setFileLevel(0);
				} else {
					a.setFileLevel(1);
				}
				
				fileList.add(a);	
				System.out.println(fileList);
			}
			
		} 
			
		
	// Goods와 Attachment 테이블 수정
	int result = gService.updateGoods(g, fileList);

		if(result == fileList.size() + 1) { 
			model.addAttribute("gId", g.getGoodsId());
			model.addAttribute("page", page);
			return "redirect:gdetail.go";
		} else {
			throw new GoodsException("게시글 수정에 실패하였습니다.");
		}
	}
	
	
	// 서버에 저장될 파일 명(changeName) 생성 메소드
	public String saveFile(MultipartFile file, String savePath) {
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originName = file.getOriginalFilename();
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + originName.substring(originName.lastIndexOf("."));
	
		String renamePath = folder + "\\" + changeName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	// 용품 게시글 삭제하기
    @RequestMapping("gdelete.go")
    public String deleteGoods(@RequestParam("gId") int gId, @RequestParam("changeName") String[] changeName, HttpServletRequest request) throws GoodsException {
      
	   String root = request.getSession().getServletContext().getRealPath("resources");
	   String savePath = root + "\\guploadFiles";
	  
	   Attachment a = new Attachment();
	   a.setBoardId(gId);
	  
       int result = gService.deleteGoods(gId);

       if(result == changeName.length + 1 ) { 
          return "redirect:glist.go";
       } else {
          throw new GoodsException("게시글 삭제에 실패하였습니다.");
       }
    }
	   
	// 사진 삭제 (게시글 수정, 삭제 할 때 사용하는) 메소드
    public void deleteFile(String fileName, String savePath2) {
       
       File f = new File(savePath2 + "\\" + fileName);
       if(f.exists()) {
          f.delete();
       }
    }

    
   // 용품 명 검색
   @RequestMapping("search.go")
   public ModelAndView searchGoods(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchGoods") String searchgName,
		   							ModelAndView mv) throws GoodsException {
	   // pi, goodsList, searchgName 전달
	   int currentPage = 1;
	   if(page != null) {
		   currentPage = page;
	   }
	   
	   int listCount = gService.getSearchListCount(searchgName);
	   
	   PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
	   
	   // 검색 값(searchgName)과 페이징 처리 데이터(pi) 전달
	   ArrayList<Goods> List = gService.selectSearchList(searchgName, pi);
	   
	   if(List != null) {
		   mv.addObject("gList", List);
		   mv.addObject("pi", pi);
		   mv.addObject("searchgName", searchgName);
		   mv.addObject("listCount", listCount);
		   mv.setViewName("goodsList");
	   } else {
		   throw new GoodsException("상품 검색에 실패하였습니다.");
	   }
	   
	   return mv;
   }

   
   // 용품 카테고리 별 리스트
   @RequestMapping("gCate.go")
   public String getCataList(@RequestParam(value="page", required=false) Integer page, @RequestParam("category") String category, HttpServletResponse response, Model model) {
	   
	   int currentPage= 1;
	   if(page != null) {
		   currentPage = page;
	   }
	   
	   int listCount = gService.getCateListCount(category);
	   
	   PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
	   
	   ArrayList<Goods> gList = gService.selectCateList(category, pi);
	   
	   
	   model.addAttribute("gList", gList);
	   model.addAttribute("pi", pi);
	   model.addAttribute("category", category);
	   model.addAttribute("listCount", listCount);
	   
	   return "goodsList";
   }
   
   
   // 구매하기 버튼 클릭 사 구매하기 창으로 이동
   @RequestMapping("order.od")
   public String orderGoods(@ModelAttribute Goods g, @RequestParam("totalPrice") String gPrice, @RequestParam("goodsQtt") int quantity, Model model) {

	     g.setStock(quantity);
	     g.setPrice(gPrice);
 		
 		 model.addAttribute("g", g);
 	
 		 return "order";
   }
   
   
   // 메인화면에 용품 리스트 출력
   @RequestMapping("goodsList.go")
   public String mainGoodsList(Model model, HttpServletResponse response) {
		
		ArrayList<Goods> gList = gService.mainGoodsList();
		Goods goods = new Goods();
		
		model.addAttribute("gList", gList);
		model.addAttribute("goods", goods);
		
		return "mainGoodsList";
   }
	
   
   // 댓글 등록 후  댓글 조회하여 댓글 목록 출력
   @RequestMapping("addReply.go")
   @ResponseBody 
   public void addReply(@ModelAttribute Reply r, List<MultipartFile> replyFiles, HttpSession session, HttpServletResponse response) throws GoodsException {
   
	   String id = ((Member)session.getAttribute("loginUser")).getEmail();
	   r.setEmail(id);
   
	   ArrayList<Attachment> fileList = new ArrayList<Attachment>();
	   int result = 0;
   
	   // 첨부파일이 있는 경우
	   if(replyFiles != null && !replyFiles.isEmpty()) {
		   for(int i = 0; i < replyFiles.size(); i++) {
			   
			   String root = session.getServletContext().getRealPath("resources");
			   String savePath = root + "\\ruploadFiles";
			   
			   String changeName = saveFile(replyFiles.get(i), savePath);
			   
			   Attachment a = new Attachment();
			   
			   a.setOriginName(replyFiles.get(i).getOriginalFilename());
			   a.setChangeName(changeName);
			   a.setFilePath(savePath);
			   a.setFileLevel(3); // 댓글 첨부파일
			   a.setBoardId(r.getGoodsId());
			   
			   fileList.add(a);
		   }
		   
		   result = gService.insertReply(r, fileList);
		   
		   if(result == fileList.size() + 1) {
			   System.out.println("controller(o) :" + result);
			   ArrayList<Reply> list = gService.selectReplyList(r.getGoodsId());
			   
			   response.setContentType("application/json; charset=UTF-8");
			   Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
			   try {
				   gson.toJson(list, response.getWriter());
			   } catch (JsonIOException e) {
				   e.printStackTrace();
			   } catch (IOException e) {
				   e.printStackTrace();
			   }
		   } else {
			   throw new GoodsException("댓글 등록에 실패하였습니다.");
		   }
		   
	   } else {
		   
		   result = gService.insertReply(r);
		   
		   if(result > 0) {
			   System.out.println("controller(x) :" + result);
			   ArrayList<Reply> list = gService.selectReplyList(r.getGoodsId());
			   
			   response.setContentType("application/json; charset=UTF-8");
			   Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
			   try {
				   gson.toJson(list, response.getWriter());
			   } catch (JsonIOException e) {
				   e.printStackTrace();
			   } catch (IOException e) {
				   e.printStackTrace();
			   }
		   } else {
			   throw new GoodsException("댓글 등록에 실패하였습니다.");
		   }
	   }
	   
	}
    
	// 댓글 리스트 가져오기
    @RequestMapping("rList.go")
    @ResponseBody
    public void getReplyList(@ModelAttribute Reply r, HttpServletResponse response) {

	   ArrayList<Reply> list = gService.selectReplyList(r.getGoodsId());
	   
	   response.setContentType("application/json; charset=UTF-8"); 
	   
	   // null 데이터도 view로 함께 전달
	   Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
	   try {
		   	gson.toJson(list, response.getWriter());
	   } catch (JsonIOException e) {
		e.printStackTrace();
	   } catch (IOException e) {
		e.printStackTrace();
	   }
    }
    
    // 댓글 첨부파일 가져오기
    @RequestMapping("rFile.go")
    @ResponseBody
    public void getReplyFile(@RequestParam("gId") int gId, HttpServletResponse response) {
    	 ArrayList<Attachment> fileList = gService.selectReplyFList(gId);
    	 
    	 response.setContentType("application/json; charset=UTF-8");
    	 
    	 Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
    	 try {
			gson.toJson(fileList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    

    // 댓글 수정 후 댓글 조회하여 댓글 목록 출력
    @RequestMapping("rupdate.go")
    @ResponseBody
    public void updateReply(@ModelAttribute Reply r, HttpServletResponse response) throws GoodsException {
    	
    	int result = gService.updateReply(r);
    	
    	if(result > 0) {
	   		ArrayList<Reply> list = gService.selectReplyList(r.getGoodsId());
	   		response.setContentType("application/json; charset=UTF-8");
	   	    Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
	   		try {
					gson.toJson(list, response.getWriter());
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
    		} else {
		   throw new GoodsException("댓글 등록에 실패하였습니다.");
	   }
    }
    
    
	// 댓글 삭제 후 댓글 조회하여 댓글 목록 출력
    @RequestMapping("rdelete.go")
    public void deleteReply(@ModelAttribute Reply r, HttpServletResponse response) throws GoodsException {
    	
    	int result = gService.deleteReply(r.getReplyId());
    	
    	if(result > 0) {
    		ArrayList<Reply> list = gService.selectReplyList(r.getGoodsId());
    		
    		response.setContentType("application/json; charset=UTF-8");
    		Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
    		try {
				gson.toJson(list, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	} else {
 		   throw new GoodsException("댓글 삭제에 실패하였습니다.");
 	   }
    }
	   

    // 마이페이지 -> 내가 쓴 용품 후기에서 삭제 버튼 눌렀을 때 댓글 삭제
    @RequestMapping("myRdelete.go")
    public String myRdelete(@RequestParam("rId") int rId, HttpServletResponse response) throws GoodsException {
       
       int result = gService.deleteReply(rId);
       
       if(result > 0) {
          return "redirect:myReply.me";
       } else {
          throw new GoodsException("댓글 삭제에 실패하였습니다.");
       }
    }


    // 품절 상품 제외한 리스트 가져오기
    @RequestMapping("saleGoods.go")
    public String soldoutExc(@RequestParam(value="page", required=false) Integer page, Model model) {
    	
    	int currentPage = 1;
    	
    	if(page != null) {
    		currentPage = page;
    	}
    	
    	int listCount = gService.getSaleGListCount();
    	
    	System.out.println(listCount);
    	
    	PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);

    	ArrayList<Goods> gList = gService.saleGoodsList(pi);
    	model.addAttribute("gList", gList);
    	model.addAttribute("pi", pi);
    	model.addAttribute("listCount", listCount);
    	
    	return "goodsList";
    	
    }
    
    
    // 선택한 항목으로 글 조회(신상품, 판매량, 낮은 가격, 높은 가격)
    @RequestMapping("select_type.go")
    public void selectTypeList(@RequestParam(value="page", required=false) Integer page, @RequestParam("select_type") String select_type,
    		@RequestParam(value="pathname", required=false) String pathname, HttpServletResponse response) {
		
    	int currentPage = 1;
    	if(page != null) {
    		currentPage = page;
    	}
    	
    	int listCount = gService.getListCount();
    	
    	PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);

    	// 품절 상품 제외 페이지에서는 품절 상품 제외한 list를 조회할 수 있또록 HashMap에 pathname 담아서 전달
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("select_type", select_type);
    	map.put("pathname", pathname);
    	
    	ArrayList<Goods> gList = gService.selectType(pi, map);
    	
    	response.setContentType("application/json; charset=UTF-8");
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	try {
			gson.toJson(gList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
        System.out.println(gList);
        System.out.println(gList.size());

    }
    
    // 선택한 타입으로 list 조회 시 ajax로 페이징 처리를 위해 페이지네이션 정보 가져오기
    @RequestMapping("getSelectTypePage.go")
    public void getPagination(@RequestParam("page") Integer page, HttpServletResponse response) {

    	int currentPage = 1;
    	if(page != null) {
    		currentPage = page;
    	}
    	
    	int listCount = gService.getListCount();
    	
    	PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
    	
    	response.setContentType("application/json; charset=UTF-8");
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	
    	try {
			gson.toJson(pi, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
    	
    	System.out.println(pi);
    	
    }
    	
}

