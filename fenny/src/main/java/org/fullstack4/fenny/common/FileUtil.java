package org.fullstack4.fenny.common;

import org.springframework.web.multipart.MultipartFile;

import javax.mail.Multipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class FileUtil {
    public static String uploadFile(HttpServletRequest req, String directory, MultipartFile file) throws ServletException, IOException {
        //원래 저장한 파일 이름 갖고옴
        String orgFile = "";
        if(file != null  ||  file.getOriginalFilename() != null ||  !file.getOriginalFilename().isEmpty()) {

            orgFile = file.getOriginalFilename(); //원래 파일의 이름
            long size = file.getSize();
//            String fileExt = orgFile.substring(orgFile.lastIndexOf("."), orgFile.length()); // 확장자명
        }
        return orgFile;
    }

    public static String fileExt(String orgFile) {
        String fileExt = orgFile.substring(orgFile.lastIndexOf("."), orgFile.length()); // 확장자명
        return fileExt;
    }


    public static String renameFile (String directory, String fileName, String fileExt, MultipartFile file) {
        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        String saveFileName = "";

        saveFileName = newName + fileExt;

        File saveFile = new File(directory + "\\" + newName + fileExt);

        try {
            file.transferTo(saveFile);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return saveFileName;
    }



}
