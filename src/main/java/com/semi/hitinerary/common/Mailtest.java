package com.semi.hitinerary.common;


import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.service.TimecapsuleService;

@Controller
public class Mailtest {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private TimecapsuleService tService;
	
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    public String sendMailTest(HttpServletRequest request, int groupNo) throws Exception{
        List<Timecapsule> tList = tService.selectListByGroupNo(groupNo);
        String filename = "";
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            // true는 html을 사용하겠다는 의미입니다.
            String path = request.getSession().getServletContext().getRealPath("resources");
            
            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < tList.size(); i++) {
            	Timecapsule capsule = tList.get(i);
            	if(tList.get(i).getCapsuleImage() != null) {
            		sb.append(capsule.getUserNickname()+"님의 캡슐<br>제목" + capsule.getCapsuleSubject() + "<br>내용:"+capsule.getCapsuleSubject() +"<br><br><br> <img src=\"cid:image" + i + "\"/> <br><br><br>");
//            		mailHelper.addInline("image" + i, new FileDataSource(path + capsule.getCapsuleImage()));
            		String imagePath = path + capsule.getCapsuleImage();
            		mailHelper.addInline("image" + i, new FileSystemResource(imagePath));
            	}else {
            		sb.append(capsule.getUserNickname()+"님의 캡슐<br>제목" + capsule.getCapsuleSubject() + "<br>내용:"+capsule.getCapsuleSubject());
            	}
            }
            // 현재 프로젝트안에 resources에 절대경로 반환
            
            
            
            
//            filename = path + "\\images\\noThumbnail.png";
            // resources위치 아래 경로 선택해주기
//            mailHelper.addInline("logo", new FileDataSource(filename));
            filename = path + "\\images\\icon.png";
            sb.append("<img src='cid:logoos'/>");
            String subject = tList.get(0).getGroupName() + " 그룹메일입니다";
            // 메일제목
            String content = sb.toString();
            // 메일 내용 + src는 아래 이미지 출력
            String from = "truewater98@gmail.com";
            // 보내는 사람 메일
            String to = "arksurplus@naver.com";
            // 받는사람 메일
            // 아래 작성
            mailHelper.addInline("logoos", new FileDataSource(filename));
            // 경로 선택한 파일 메일 안으로 보내주기            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
//            mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);            
            mailHelper.setTo(to);
//            모든 멤버에게 전달
//            for(int i = 0; i < tList.size(); i++) {
//            	tList.get(i).getUserEmail();
//            	mailHelper.setTo(to);
//            	mailSender.send(mail);            	
//            }
            // 메일 발송
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

}
