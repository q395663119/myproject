package controller;

import entity.Userinfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class LoginAndRegisterController {
    @Autowired
    UserServiceImpl usi;

    @RequestMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, @RequestParam String flag, HttpServletRequest req){
        Userinfo ui = usi.SelectByUsername(username);
        if (ui == null) {
            return "none";
        }else{
            if(DigestUtils.md5Hex(password.getBytes()).equals(ui.getPassword())){
                if(flag.equals("true")){
                    ui.setPassword(password);
                    req.getSession().setAttribute("info",ui);
                }else{
                    req.getSession().removeAttribute("info");
                }
                return "true";
            }else{
                return "error";
            }
        }
    }

    @RequestMapping("/register")
    public String register(@RequestParam String username,@RequestParam String password,@RequestParam String email){

        if(usi.SelectByUsername(username)!=null){
            return "existed";
        }else{
            Userinfo ui = new Userinfo();
            ui.setUsername(username);
            ui.setPassword(DigestUtils.md5Hex(password.getBytes()));
            ui.setEmail(email);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            ui.setRegisterTime(sdf.format(date));
            int line = usi.insert(ui);
            if(line>0){
                return "yes";
            }else{
                return "no";
            }
        }

    }
}
