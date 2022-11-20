package com.example.common;

import com.example.bean.FoodVO;
import com.example.dao.FoodDAO;
import com.example.util.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public FoodVO uploadPhoto(HttpServletRequest request){
        String filename ="";
        int sizeLimit = 15*1024*1024;
        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        FoodVO one = null;
        MultipartRequest multipartRequest = null;
        try{
            multipartRequest = new MultipartRequest(request, realPath,sizeLimit, "utf-8",new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");
            one = new FoodVO();
            String seq = multipartRequest.getParameter("sid");
            if(seq!=null&&!seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setDetail(multipartRequest.getParameter("detail"));

            if(seq!=null&&!seq.equals("")){
                FoodDAO dao = new FoodDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(seq));
                if(filename!=null && oldfilename!=null) FileUpload.deleteFile(request, oldfilename);
                else if(filename==null&&oldfilename!=null) filename = oldfilename;
            }
            one.setPhoto(filename);
        } catch (IOException e){
            e.printStackTrace();
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }

}
