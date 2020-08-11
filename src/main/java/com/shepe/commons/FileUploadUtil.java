//package com.shepe.commons;
//
//import java.io.File;
//import java.text.DecimalFormat;
//import java.util.Calendar;
//import java.util.UUID;
//
//import org.springframework.web.multipart.MultipartFile;
//
//import com.shepe.client.payment.PaymentVO;
//import com.springbook.biz.board.BoardVO;
//
//public class FileUploadUtil {
//
//	public void fileUpload(PaymentVO vo, String fileName) throws Exception {
//		
//		MultipartFile uploadFile = vo.getUploadFile();
//		UUID uid = UUID.randomUUID();
//		String savedName = uid.toString() + "_" + fileName;
//		vo.setFileName(savedName);
//		String savedPath = calcPath();
//		System.out.println();
//		System.out.println("<<<<<<<<" + savedPath);
//		uploadFile.transferTo(new File("D:/swork/SpringMVC_annotation_349/src/main/webapp/WEB-INF/upload/" + savedPath + savedName));
//	}
//	
//	private String calcPath() {
//		
//		Calendar cal = Calendar.getInstance();
//		String yearPath = File.separator + cal.get(Calendar.YEAR);
//		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
//		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		
//		System.out.println(yearPath);
//		System.out.println(monthPath);
//		System.out.println(datePath);
//		
//		makeDir("D:/swork/SpringMVC_annotation_349/src/main/webapp/WEB-INF/upload/", yearPath, monthPath, datePath);
//		
//		return datePath + "/";
//	}
//	
//	private void makeDir(String uploadPath, String yearPath, String monthPath, String datePath) {
//		
//		if(new File(uploadPath + datePath).exists()) {
//			return;
//		}
//		
//		File dirPath = new File(uploadPath + datePath);
//		System.out.println(">>" + dirPath);
//		if(!dirPath.exists()) {
//			dirPath.mkdirs();
//		}
//	}
//}
