package or.junglecast.mvc.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import or.junglecast.fileupload.FileUpload;
import or.junglecast.mvc.dao.MainDao;
import or.junglecast.mvc.dao.WriteArticleDao;
import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.EditorVO;
import or.junglecast.vo.PictureVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WriteArticleModel {

	@Autowired
	private MainDao mDao;
	@Autowired
	private WriteArticleDao waDao;
	
	@RequestMapping("writeArticle")
	public ModelAndView gotoMain(){
		ModelAndView mav = new ModelAndView("writeArticle");
		mav.addObject("categories", mDao.selectCategoryLists());
		return mav;
	}

	@RequestMapping(value = "insertArticle", method = RequestMethod.POST)
	public ModelAndView insertArticle(ArticleVO aVo, HttpSession session){
		ModelAndView mav = new ModelAndView("jsonView");
		int id = 0;
		try{
			id = (int) session.getAttribute("id");
		}catch(Exception e){
			id=0;
		}
		aVo.setM_id(id);
		int insertedArticle = waDao.insertArticle(aVo);
		mav.addObject("article_id", insertedArticle);
		return mav;
	}
	
	
	@RequestMapping(value = "uploadImgs", method = RequestMethod.POST)
	@ResponseBody
	 public ModelAndView uploadImgs(MultipartHttpServletRequest multipartRequest) throws IOException{
	  List<MultipartFile> file = multipartRequest.getFiles("pic_url");   //뷰에서 form으로 넘어올 때 name에 적어준 이름입니다.

	 
	  Calendar cal=null;
	  String fileName, fileType, replaceName;
	  String path =  new HttpServletRequestWrapper(multipartRequest).getSession().getServletContext().getRealPath("/resources/articleContents");
	  System.out.println("경로 : " + path);
	  
	  String imgNames="";
	  
	  for(int i=0; i<file.size(); i++){
		  cal = Calendar.getInstance();
		  fileName = file.get(i).getOriginalFilename();
		  fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		  replaceName = cal.getTimeInMillis() + fileType;  //파일 이름의 중복을 막기 위해서 이름을 재설정합니다.
		  FileUpload.fileUpload(file.get(i), path, replaceName);
		  imgNames += replaceName;
		  if(i < file.size()-1) imgNames += "*";
		  
	  }
	  ModelAndView mav = new ModelAndView("jsonView");
	  System.out.println(imgNames);
	  mav.addObject("pic_names", imgNames);
	  return mav;

	 }
	@RequestMapping(value = "insertPicture", method = RequestMethod.POST)
	public ModelAndView insertPicture(PictureVO pvo){
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println(pvo.getArticle_id() +", " + pvo.getPic_text() + ", " + pvo.getPic_url());
		int result = waDao.insertPicture(pvo);
		System.out.println("결과값 : " + result);
		mav.addObject("pic_id" , result);
		return mav;
	}
	
	@RequestMapping("updateArticlePicID")
	public ModelAndView updateArticlePicID(@RequestParam("pic_id") String p_id, @RequestParam("article_id") String a_id){
		ModelAndView mav = new ModelAndView("jsonView");
		int pic_id = Integer.parseInt(p_id);
		int article_id = Integer.parseInt(a_id);
		waDao.updateArticlePicID(pic_id, article_id);
		return mav;
	}
	
	@RequestMapping("writeArticle2")
	public ModelAndView editorSubmit(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("writeArticle2");
		mav.addObject("categories", mDao.selectCategoryLists());
		System.out.println("제목:"+request.getParameter("article_title"));
		System.out.println("설명:"+request.getParameter("article_subtitle"));
		System.out.println("내용:"+request.getParameter("content"));
		return mav;
	}
	@RequestMapping("/photoUpload")
	 public String file_uploader(HttpServletRequest request, HttpServletResponse response, EditorVO editor){
		 String return1=request.getParameter("callback");
		 String return2="?callback_func=" + request.getParameter("callback_func");
		 String return3="";
		 String name = "";
		 try {
			if(editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null && !editor.getFiledata().getOriginalFilename().equals("")) {
	             // 기존 상단 코드를 막고 하단코드를 이용
	            name = editor.getFiledata().getOriginalFilename().substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator)+1);
				String filename_ext = name.substring(name.lastIndexOf(".")+1);
				filename_ext = filename_ext.toLowerCase();
			   	String[] allow_file = {"jpg","png","bmp","gif"};
			   	int cnt = 0;
			   	for(int i=0; i<allow_file.length; i++) {
			   		if(filename_ext.equals(allow_file[i])){
			   			cnt++;
			   		}
			   	}
			   	if(cnt == 0) {
			   		return3 = "&errstr="+name;
			   	} else {
			   		//파일 기본경로
		    		String dftFilePath = request.getSession().getServletContext().getRealPath("/");
		    		//파일 기본경로 _ 상세경로
		    		String filePath = dftFilePath + "resources"+ File.separator + "articleContents" + File.separator;
		    		File file = new File(filePath);
		    		if(!file.exists()) {
		    			file.mkdirs();
		    		}
		    		String realFileNm = "";
		    		SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
					String today= formatter.format(new java.util.Date());
					realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					///////////////// 서버에 파일쓰기 /////////////////
					editor.getFiledata().transferTo(new File(rlFileNm));
					///////////////// 서버에 파일쓰기 /////////////////
		    		return3 += "&bNewLine=true";
		    		return3 += "&sFileName="+ realFileNm;
		    		return3 += "&sFileURL=/junglecast/resources/articleContents/"+realFileNm;
			   	}
			}else {
				  return3 += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return "redirect:"+return1+return2+return3;
	}
	
	@RequestMapping(value="/multiplePhotoUpload")
	 public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
		try {
			 //파일정보
			 String sFileInfo = "";
			 //파일명을 받는다 - 일반 원본파일명
			 String filename = request.getHeader("file-name");
			 //파일 확장자
			 String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			 //확장자를소문자로 변경
			 filename_ext = filename_ext.toLowerCase();
			 	
			 //이미지 검증 배열변수
			 String[] allow_file = {"jpg","png","bmp","gif"};

			 //돌리면서 확장자가 이미지인지 
			 int cnt = 0;
			 for(int i=0; i<allow_file.length; i++) {
			 	if(filename_ext.equals(allow_file[i])){
			 		cnt++;
			 	}
			 }

			 //이미지가 아님
			 if(cnt == 0) {
				 PrintWriter print = response.getWriter();
				 print.print("NOTALLOW_"+filename);
				 print.flush();
				 print.close();
			 } else {
			 //이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
			 //파일 기본경로
				 
			 String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //파일 기본경로 _ 상세경로
			 String filePath = dftFilePath + "resources" + File.separator +"articleContents" + File.separator;
			 File file = new File(filePath);
			 if(!file.exists()) {
			 	file.mkdirs();
			 }
			 String realFileNm = "";
			 SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmmss");
			 String today= formatter.format(new java.util.Date());
			 realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			 String rlFileNm = filePath + realFileNm;
			 ///////////////// 서버에 파일쓰기 ///////////////// 
			 InputStream is = request.getInputStream();
			 OutputStream os=new FileOutputStream(rlFileNm);
			 int numRead;
			 byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			 while((numRead = is.read(b,0,b.length)) != -1){
			 	os.write(b,0,numRead);
			 }
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 ///////////////// 서버에 파일쓰기 /////////////////

			 // 정보 출력
			 sFileInfo += "&bNewLine=true";
			 // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			 sFileInfo += "&sFileName="+ realFileNm;
			 sFileInfo += "&sFileURL="+"/junglecast/resources/articleContents/"+realFileNm;
			 PrintWriter print = response.getWriter();
			 print.print(sFileInfo);
			 print.flush();
			 print.close();
			 }	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
