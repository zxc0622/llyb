package com.qdum.llhb.forum.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.adsReser.model.AdvChannel;
import com.qdum.llhb.forum.model.*;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;


import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Administrator on 2015/12/28.
 */
@ControllerBind(controllerKey = "/forum")
public class PostingController extends Controller{
    private final  static Logger logger = Logger.getLogger(PostingController.class);
    private final  static  int PAGESIZE = Integer.parseInt(PropKit.get("pageNumber"));

    public void posting(){
        User u = UserUtils.getUser();
        /*if(null==u.getId()){
            redirect("/login");
            return;
        }*/
        setAttr("user",u);
        setAttr("today",new Date());
        String boradId = getPara("boradId");
        if(StrKit.isBlank(boradId)){
            boradId = "1";
        }
        List<Record> records = ForumBoardList.dao.getRecord(boradId);
        String pid = getPara("pid");
        if(null!=pid&&!pid.equals("")){
            setAttr("post",ForumPost.dao.getForumPost(pid));
            List<Record> atts = ForumPostAttachment.dao.getAttachmentByPost(pid);
            setAttr("as",atts);
        }
        if(u.getId() != null){
            Record black = ForumUserBlacklist.dao.checkNoPosting(u.getId());
            setAttr("b",black);
        }

        setAttr("pos",ForumBoardList.dao.getRecordParent(boradId));
        setAttr("pid",pid);
        setAttr("boradId",boradId);
        setAttr("themes",records );
        render("posting.jsp");
    }
    /**
     * save
     */
    public void save(){
        boolean b = false;
        ForumPost p = ForumPost.dao.findById(getPara("pid"));
        if(null == p){
            p = new ForumPost();
            b = true;
        }
        User u = UserUtils.getUser();
        Map<String, String []> maps = getParaMap();
        Set<String> keys = maps.keySet();
        for(String key:keys){
            String[] s = maps.get(key);
            if(key.equals("pid")){

            }else if(key.equals("editorValue")){

            }else if(!key.equals("attach_name")&&!key.equals("attach_href")&&!key.equals("attachment_file")){
                p.set(key,s[0]);
            }
        }
        if(b){
            p.set("create_by",u.getId()).set("create_date",new Date());
            p.save();
        }else{
            p.set("update_by",u.getId()).set("update_date",new Date());
            p.update();
        }

        //附件保存，先判断一下该帖子有没有保存过附件
        String pid = p.getLong("id")+"";
        List<Record> oldatt = ForumPostAttachment.dao.getAttachmentByPost(pid);
        if(null!=oldatt){
            Db.update("UPDATE forum_posts_attachments set del_flag=1 WHERE post_id=?",pid);
        }
        String[] names = getParaValues("attach_name");
        String[] urls = getParaValues("attach_href");
        if(StrKit.notNull(urls)){
            for(int i = 0;i<urls.length;i++){
                ForumPostAttachment a = new ForumPostAttachment();
                a.set("post_id",p.get("id"));
                a.set("attach_name",names[i]);
                a.set("attach_href",urls[i]);
                a.set("create_by",u.getId()).set("create_date",new Date());
                a.save();
            }
        }
        if(p.get("sta").equals("0")){
            //草稿
            redirect("/forum/posting?pid="+p.get("id")+"&boradId="+getPara("board_id"));
        }else{
            //发表帖子
            new PointController().Postforum(p.getLong("id"));
            redirect("/forum/list?boardId="+p.get("board_id"));
        }

    }
    /**
     * 某条帖子
     */
    public void forumlistUser(){
        long fid = 0l;
        if(StrKit.notNull(getPara("fid"))) {
            fid = getParaToLong("fid");
            ForumPost fp = ForumPost.dao.findById(fid);
            Record pos = ForumBoardList.dao.getRecordParent(fp.getLong("board_id")+"");
            setAttr("pos",pos);
            fp.set("page_view", fp.getLong("page_view") + 1).update();//浏览次数累加
            setAttr("fid", fid);
            List<Record> admin = ForumBoardMaster.dao.getAdministra(fp.getLong("board_id"),pos.getLong("lid"),pos.getLong("bid"));
            setAttr("admin", admin);//管理员有资格删除修改
            /*Record uu = ForumPost.dao.getCountByUserId(fp.getLong("id"));
            setAttr("uucount",uu.get("mm"));*/
        }

        String paramUid = getPara("paramUid");
        Page<Record> recordPage = ForumPost.dao.getRecordsBypPost(getParaToInt(0,1),PAGESIZE,fid,paramUid);
        /**
         * 回复轨迹
         */
        setAttr("paramUid",paramUid);

        List<Record> replyTs = ForumReplyTrace.dao.getRecordsAll();
        Record rr = ForumPost.dao.getPost(fid);
        List<Record> atts = ForumPostAttachment.dao.getAttachmentByPost(fid+"");
        User u = UserUtils.getUser();
        if(u.getId() != null){
            Record black = ForumUserBlacklist.dao.checkNoPosting(UserUtils.getUser().getId());
            setAttr("b",black);
        }

        setAttr("as",atts);
        setAttr("t",rr);
        setAttr("rts",replyTs);

        setAttr("user",u);
        setAttr("today",new Date());
        setAttr("recordPage", recordPage);
        setAttr("num",ForumPost.dao.getNumberByPost(fid));
        setAttr("lists", recordPage.getList());
        render("forumUser.jsp");
    }
    /**
     * 删除主题
     */
    public void deletetheme(){
        ForumPost f = ForumPost.dao.findById(getPara("fid"));
        boolean b=  f.set("dei_flag","1").update();
        renderJson(b);
    }
    /**
     * 置顶
     */
    public void  puttop(){
        ForumPost f = ForumPost.dao.findById(getPara("fid"));
        boolean b=  f.set("is_top","1").update();
        renderJson(b);
    }
    /**
     * 取消置顶
     */
    public void  poptop(){
        ForumPost f = ForumPost.dao.findById(getPara("fid"));
        boolean b=  f.set("is_top","0").update();
        renderJson(b);
    }
    /**
     * 删除回复
     *
     */
    public void  deleteReply(){
        boolean b = false;
        /*List<ForumReply> rs =  ForumReply.dao.getReplyByPost(getPara("fid"));
        for(ForumReply r:rs){
            b = r.set("del_flag","1").update();
        }
        renderJson(b);*/
        ForumReply r = ForumReply.dao.getByThemeAndReply(getPara("fid"),getPara("rid"));
        b = r.set("del_flag","1").update();
        renderJson(b);
    }
    /**
     * 禁言
     */
    public void stoptalking(){
       /* User user  = User.dao.findById(getPara("uid"));
        boolean b = user.set("on_state","1").update();
        renderJson(b);*/

    }
    /**
     * 只看该作者
     */
    public void onlysee(){
        long fid = 0l;
        if(StrKit.notNull(getPara("fid"))) {
            fid = getParaToLong("fid");
            ForumPost fp = ForumPost.dao.findById(fid);
            fp.set("page_view", fp.getLong("page_view") + 1).update();//浏览次数累加
            setAttr("fid", fid);
            /*Record admin = ForumBoardMaster.dao.getAdministra(fp.getLong("board_id"));
            setAttr("admin", admin);//管理员有资格删除修改*/
            /*Record uu = ForumPost.dao.getCountByUserId(fp.getLong("id"));
            setAttr("uucount",uu.get("mm"));*/
        }
        Page<Record> recordPage = ForumPost.dao.getRecordsBypPost(getParaToInt(0,1),PAGESIZE,fid,getPara("paramUid"));
        /**
         * 回复轨迹
         */

        List<Record> replyTs = ForumReplyTrace.dao.getRecordsAll();
        Record rr = ForumPost.dao.getPost(fid);
        setAttr("t",rr);
        setAttr("rts",replyTs);
        User u = UserUtils.getUser();
        setAttr("num",ForumPost.dao.getNumberByPost(fid));
        setAttr("user",u);
        setAttr("today",new Date());
        setAttr("recordPage", recordPage);
        setAttr("lists", recordPage.getList());
        render("forumUser.jsp");
    }
    /**
     * 发表  回复的回复
     */
    public void report(){
        User user = UserUtils.getUser();
        if(user.getId()==null){
            redirect("/login");
            return;
        }
        ForumReplyTrace t = new ForumReplyTrace();
        /*Record t = new Record();*/
        t.set("reply_id",getParaToLong("rid"));
        t.set("par_id",getParaToLong("tid"));
        t.set("create_by",user.getId());
        t.set("trace_content",getPara("content"));
        t.set("create_date",new Date());
        boolean b =  t.save();
        ForumMessage m = new ForumMessage();
        m.set("user_id",user.getId());
        m.set("mes_content",getPara("content"));
        m.set("mes_href",this.path(getParaToLong("forumid")));
        m.set("create_by",user.getId());
        m.set("type","1");
        m.set("create_date",new Date()).save();
        List<Record> replyTs = ForumReplyTrace.dao.getRecordsNew();//返回最新的一条回复
        renderJson(replyTs);

    }
    /**
     * 发表对某条帖子的回复
     */
    public void reportReply(){
        User user = UserUtils.getUser();
        if(user.getId()==null){
            redirect("/login");
            return;
        }
        ForumReply p = new ForumReply();
        Map<String, String []> maps = getParaMap();
        Set<String> keys = maps.keySet();

        for(String key:keys){
            String[] s = maps.get(key);
            if(key.equals("create_date")){
                p.set(key,new Date());
            }else if(key.equals("editorValue")||key.equals("parmamfid")){

            }else{
                p.set(key,s[0]);
            }
        }
        p.save();
        ForumMessage m = new ForumMessage();
        m.set("user_id",user.getId());
        m.set("mes_content",getPara("rp_content"));
        m.set("mes_href",this.path(getParaToLong("parmamfid")));
        m.set("create_by",user.getId());
        m.set("type","0");
        m.set("create_date",new Date()).save();
        String fid = getPara("parmamfid");
        new PointController().Replyforum(Long.parseLong(fid));
        redirect("/forum/forumlistUser?fid="+fid);

    }
    public String path(long fid){
        return getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+getRequest().getContextPath()+"/forum/forumlistUser?fid="+fid;
    }
    /**
     * 论坛消息提醒
     */
    public void messageCall(){
        int yeshu = PAGESIZE;
        try {
            yeshu  =getParaToInt("paginateFenye");
            setAttr("paginateFenye",yeshu);
        } catch (Exception e) {
            yeshu = PAGESIZE;
        }
        Page<Record> recordPage = ForumMessage.dao.getRecord(getParaToInt(0,1),yeshu,"0");
        List<Record> mounts = ForumMessage.dao.getCountByType();
        setAttr("mounts",mounts);
        setAttr("recordPage",recordPage);
        setAttr("one",recordPage.getList());
        render("messageCall.jsp");
    }
    public void messageCallre(){
        int yeshu = PAGESIZE;
        try {
            yeshu  =getParaToInt("paginateFenye");
            setAttr("paginateFenye",yeshu);
        } catch (Exception e) {
            yeshu = PAGESIZE;
        }
        Page<Record> recordPage = ForumMessage.dao.getRecord(getParaToInt(0,1),yeshu,"1");
        List<Record> mounts = ForumMessage.dao.getCountByType();
        setAttr("mounts",mounts);
        setAttr("recordPage",recordPage);
        setAttr("two",recordPage.getList());
        render("messageCallre.jsp");
    }
    /**
     * 加精
     */
    public void jiajing(){
        ForumPost f = ForumPost.dao.findById(getPara("fid"));
        boolean b=  f.set("good","1").update();
        renderJson(b);
    }
    /**
     * 取消加精
     */
    public void nojiajing(){
        ForumPost f = ForumPost.dao.findById(getPara("fid"));
        boolean b=  f.set("good","0").update();
        renderJson(b);
    }
    /**
     * 删除回复的回复
     */
    public void deleteReplyTo(){
        ForumReplyTrace t = ForumReplyTrace.dao.findById(getPara("fid"));
        Boolean b = t.set("del_flag","1").update();
        renderJson(b);

    }

}
