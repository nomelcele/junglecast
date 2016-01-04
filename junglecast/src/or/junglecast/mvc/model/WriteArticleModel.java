package or.junglecast.mvc.model;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequestWrapper;

import or.junglecast.fileupload.FileUpload;
import or.junglecast.mvc.dao.MainDao;
import or.junglecast.mvc.dao.WriteArticleDao;
import or.junglecast.vo.ArticleVO;
import or.junglecast.vo.PictureVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(value = "uploadArticle", method = RequestMethod.POST)
	public ModelAndView insertArticle(ArticleVO aVo){
		ModelAndView mav = new ModelAndView("jsonView");
		System.out.println(aVo.getArticle_title()+", " + aVo.getArticle_subtitle() + " , " + aVo.getCategory_id());
		int insertedArticle = waDao.insertArticle(aVo);
		mav.addObject("article_id", insertedArticle);
		return mav;
	}
	
	
	@RequestMapping(value = "uploadImgs", method = RequestMethod.POST)
	@ResponseBody
	 public ModelAndView uploadImgs(Model model, MultipartHttpServletRequest multipartRequest) throws IOException{
	 
 
	  MultipartFile file = multipartRequest.getFile("pic_url");   //뷰에서 form으로 넘어올 때 name에 적어준 이름입니다.
	  System.out.println(model.toString());
	  
	  int article_id = Integer(multipartRequest.getAttribute("article_id"));
	  String pic_text = multipartRequest.getAttribute("pic_text").toString();
	  int pic_order = Integer(multipartRequest.getAttribute("pic_order"));
	  System.out.println("article id, pic_text, pic_order" + article_id +", " + pic_text + ", " + pic_order);
	  
	  Calendar cal = Calendar.getInstance();
	  String fileName = file.getOriginalFilename();
	  String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	  String replaceName = cal.getTimeInMillis() + fileType;  //파일 이름의 중복을 막기 위해서 이름을 재설정합니다.

	  String path =  new HttpServletRequestWrapper(multipartRequest).getSession().getServletContext().getRealPath("resources/articleContents");
	  System.out.println("경로 : " + path);
	  FileUpload.fileUpload(file, path, replaceName);
	  
	  PictureVO pvo = new PictureVO(article_id, pic_order, replaceName, pic_text) ;
	  ModelAndView mav = new ModelAndView("jsonView");
	  //mav.addObject("pic_name", replaceName); //이미지 파일 정보 db에 업로드하고 pic_id를 받아옴
	  mav.addObject("pic_id", waDao.insertPicture(pvo));
	  return new ModelAndView("jsonView");

	 }

	private int Integer(Object attribute) {
		// TODO Auto-generated method stub
		return 0;
	}
}
