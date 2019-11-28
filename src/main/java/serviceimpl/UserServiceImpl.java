package serviceimpl;

import entity.Userinfo;
import mapper.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserinfoMapper uim;

    public Userinfo SelectByUsername(String username) {
        return uim.SelectByUsername(username);
    }

    public int deleteByPrimaryKey(Integer uId) {
        return uim.deleteByPrimaryKey(uId);
    }

    public int insert(Userinfo record) {
        return uim.insert(record);
    }

    public int insertSelective(Userinfo record) {
        return uim.insertSelective(record);
    }

    public Userinfo selectByPrimaryKey(Integer uId) {
        return uim.selectByPrimaryKey(uId);
    }

    public int updateByPrimaryKeySelective(Userinfo record) {
        return uim.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Userinfo record) {
        return uim.updateByPrimaryKey(record);
    }
}
