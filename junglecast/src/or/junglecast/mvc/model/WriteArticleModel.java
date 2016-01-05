package or.junglecast.mvc.model;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequestWrapper;

import or.junglecast.fileupload.FileUpload;
import or.junglecast.mvc.dao.MainDao;
import or.junglecast.mvc.dao.WriteArticleDao;
import or.junglecast.vo.ArticleVO;
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
	public ModelAndView insertArticle(ArticleVO aVo){
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println(aVo.getArticle_title()+", " + aVo.getArticle_subtitle() + " , " + aVo.getCategory_id());
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
	  String path =  new HttpServletRequestWrapper(multipartRequest).getSession().getServletContext().getRealPath("resources/articleContents");
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
}
