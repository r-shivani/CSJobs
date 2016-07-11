package csjobs.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
public class JobController {

   @Autowired
    private JobDao jobDao;
    
    @Autowired
    private UserDao userDao;

    @RequestMapping({ "/index.html", "/job/list.html" })
    public String list( ModelMap models )
    {
        models.put( "openJobs", jobDao.getOpenJobs() );
        return "job/list";
    }

    
 
    
    @RequestMapping(value = "/job/review.html")
    public String review( HttpSession session,@RequestParam long id )
    {
    	
    	 session.setAttribute( "job1", jobDao.getJob(id) );
    	 return "redirect:/job/view.html";
    }
    
    
    
    @RequestMapping("/job/view.html")
    public String view( HttpSession session, ModelMap models )
    {
    	Job job1 = (Job) session
 	            .getAttribute( "job1" );
        models.put( "job", jobDao.getJob( job1.getId() ) );
        return "job/view";
    }
    
   
    
    @RequestMapping("/application/reviewForApplicant.html")
    public String viewForApplicant(  HttpSession session,@RequestParam long id )
    {
    	session.setAttribute( "job1", jobDao.getJob(id) );
   	 return "redirect:/application/viewForApplicant.html";
    }
    
    @RequestMapping("/application/viewForApplicant.html")
    public String viewForApplicant( HttpSession session, ModelMap models )
    {
    	
    	Job job1 = (Job) session
     .getAttribute( "job1" );
models.put( "job", jobDao.getJob( job1.getId() ) );
        return "application/viewForApplicant";
    }
    
    
   
    @RequestMapping("/job/reviewJobAdmin.html")
    public String viewJobAdmin( HttpSession session,@RequestParam Long id, ModelMap models )
    {
        
        session.setAttribute( "jobforadmin", jobDao.getJob(id) );
   	 return "redirect:/job/viewJobAdmin.html";
    }
    @RequestMapping("/job/viewJobAdmin.html")
    public String viewJobAdmin( HttpSession session, ModelMap models )
    {
    	Job jobforadmin = (Job) session
     .getAttribute( "jobforadmin" );
models.put( "job", jobDao.getJob( jobforadmin.getId() ) );
        return "job/viewJobAdmin";
    }
    
    @RequestMapping(value = "/job/createJob.html", method = RequestMethod.POST)
    public String createJob(@RequestParam String title , @RequestParam String description ,@RequestParam( required=false) String publishDate , @RequestParam ( required=false) String closeDate ,@RequestParam( required=false) String[] members, @RequestParam String chair  ) throws ParseException
    
    {
    	Job job= new Job();
    	SimpleDateFormat formatter = new SimpleDateFormat("M/d/yyyy");
    	if(publishDate!=null&&publishDate!=""){
        	Date date1 = formatter.parse(publishDate);
        	job.setPublishDate(date1);
        	}
        	if(publishDate!=null&&publishDate!=""){
        	Date date2 = formatter.parse(closeDate);
        	job.setCloseDate(date2);
        	}
    	
    	job.setTitle(title);
    	
    	job.setCommitteeChair(userDao.getUser(chair));
    	job.setDescription(description);
    	List<User> committeeMembers = new ArrayList<User>();
    	if(members!=null)
    	for(String m : members){
    		committeeMembers.add(userDao.getUser(m));
    	}
    	
    	if(!committeeMembers.contains(chair)) {
    		committeeMembers.add(userDao.getUser(chair));
    	}
    	job.setCommitteeMembers(committeeMembers);
    	jobDao.saveJob(job);
        return "redirect:/admin.html";
    }
    
    @RequestMapping(value = "/job/createJob.html", method = RequestMethod.GET)
    public String createJob(ModelMap models)
    {
    	
    	models.put("reviewers", userDao.getReviewers() );
        return "job/createJob";
    }
    
    @RequestMapping(value = "/job/edit.html", method = RequestMethod.POST)
    public String edit(@RequestParam long jobId,@RequestParam String title , @RequestParam String description ,@RequestParam ( required=false) String publishDate , @RequestParam ( required=false) String closeDate ,@RequestParam( required=false) String[] members, @RequestParam String chair  ) throws ParseException
    {
    	
    	Job job= jobDao.getJob(jobId);
    	SimpleDateFormat formatter = new SimpleDateFormat("M/d/yyyy");
    	if(publishDate!=null&&publishDate!=""){
    	Date date1 = formatter.parse(publishDate);
    	job.setPublishDate(date1);
    	}
    	if(closeDate!=null&&closeDate!=""){
    	Date date2 = formatter.parse(closeDate);
    	job.setCloseDate(date2);
    	}
    	
    	job.setTitle(title);
    	
    	
    	job.setCommitteeChair(userDao.getUser(chair));
    	
    	List<User> committeeMembers = new ArrayList<User>();
    	if(members!=null)
    	for(String m : members){
    		committeeMembers.add(userDao.getUser(m));
    	}
    	if(!committeeMembers.contains(chair)) {
    		committeeMembers.add(userDao.getUser(chair));
    	}
    	job.setCommitteeMembers(committeeMembers);
    	jobDao.saveJob(job);
        return "redirect:/admin.html";
    }
    
    @RequestMapping(value = "/job/reedit.html")
    public String view1( HttpSession session,@RequestParam long id )
    {
    	
    	 session.setAttribute( "jobforedit", jobDao.getJob(id) );
    	 return "redirect:/job/edit.html";
    }
    
    
    @RequestMapping(value = "/job/edit.html", method = RequestMethod.GET)
    public String edit(HttpSession session,ModelMap models)
    {

    	Job jobforedit = (Job) session
     .getAttribute( "jobforedit" );
    	Job job= jobDao.getJob(jobforedit.getId());
    	SimpleDateFormat formatter = new SimpleDateFormat("M/d/yyyy");
    	if(job.getCloseDate()!=null)
    	models.put("closeDate", formatter.format(job.getCloseDate()));
    	if(job.getPublishDate()!=null)
    	models.put("publishDate", formatter.format(job.getPublishDate()));
    	models.put("job", job);
    	models.put("reviewers", userDao.getReviewers() );
    	models.put("checkedReviewers", job.getCommitteeMembers());
    	List<User> un=userDao.getReviewers();
    	un.removeAll(job.getCommitteeMembers());
    	
    	models.put("uncheckedReviewers", un);
        return "job/edit";
    }
    

}
