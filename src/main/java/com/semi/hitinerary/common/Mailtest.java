package com.semi.hitinerary.common;


import java.io.File;

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

@Controller
public class Mailtest {

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
    public String sendMailTest(HttpServletRequest request) throws Exception{
        
        String subject = "test 메일입니다";
        // 메일제목
        String content = "메일 테스트 내용 <br> 테스트테스트 <img src='cid:logo'/>";
        // 메일 내용 + src는 아래 이미지 출력
        String from = "truewater98@gmail.com";
        // 보내는 사람 메일
        String to = "akrsurplus@gmail.com";
        // 받는사람 메일
        String filename = "";
        // 아래 작성
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            String path = request.getSession().getServletContext().getRealPath("resources");
            // 현재 프로젝트안에 resources에 절대경로 반환
            filename = path + "\\images\\noThumbnail.png";
            // resources위치 아래 경로 선택해주기
            mailHelper.addInline("logo", new FileDataSource(filename));
            // 경로 선택한 파일 메일 안으로 보내주기            
            mailSender.send(mail);
            // 메일 발송
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
	@RequestMapping(value = "/pathtest", method = RequestMethod.GET)
	public String Pathtest(HttpServletRequest request,Model model) {
		String path = request.getSession().getServletContext().getRealPath("resources");
		path += "\\images\\noThumbnail.png";
        System.out.println("현재 작업 경로: " + path);
		model.addAttribute("path", path);
		return "test";
	}

}
