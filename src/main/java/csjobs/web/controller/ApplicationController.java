package csjobs.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.Application;
import csjobs.model.dao.ApplicationDao;

@Controller
public class ApplicationController {

    @Autowired
    private ApplicationDao applicationDao;

    @RequestMapping("/application/view.html")
    public String view( HttpSession session, ModelMap models )
    {
    	Application app1 = (Application) session
 	            .getAttribute( "app1" );
        models.put( "application", applicationDao.getApplication( app1.getId() ) );
        return "application/view";
    }

    @RequestMapping(value = "/application/review.html")
    public String reviewerview1( HttpSession session,@RequestParam long id )
    {
    	
    	 session.setAttribute( "app1", applicationDao.getApplication(id) );
    	 return "redirect:/application/view.html";
    }
    
    /*@RequestMapping("/application/reviewForReviewer.html")
    public String viewForReviewer(  HttpSession session,@RequestParam long id )
    {
    	session.setAttribute( "job1", jobDao.getJob(id) );
   	 return "redirect:/application/viewForReviewer.html";
    }
    
    @RequestMapping("/application/viewForReviewer.html")
    public String viewForReviewer( HttpSession session, ModelMap models )
    {
    	
    	Job job1 = (Job) session
     .getAttribute( "job1" );
models.put( "job", jobDao.getJob( job1.getId() ) );
        return "application/viewForReviewer";
    }*/
    
    @RequestMapping("/application/viewForReviewer.html")
    public String viewForReviewer( HttpSession session, ModelMap models )
    {
    	Application app1 = (Application) session
 	            .getAttribute( "app1" );
        models.put( "application", applicationDao.getApplication( app1.getId() ) );
        return "application/viewForReviewer";
    }

    @RequestMapping(value = "/application/reviewForReviewer.html")
    public String viewForReviewer( HttpSession session,@RequestParam long id )
    {
    	
    	 session.setAttribute( "app1", applicationDao.getApplication(id) );
    	
    	 return "redirect:/application/viewForReviewer.html";
    }

    
    @RequestMapping("/application/viewForAdmin.html")
    public String viewForAdmin( HttpSession session, ModelMap models )
    {
    	Application app1 = (Application) session
 	            .getAttribute( "app1" );
        models.put( "application", applicationDao.getApplication( app1.getId() ) );
        return "application/viewForAdmin";
    }

    @RequestMapping(value = "/application/reviewForAdmin.html")
    public String viewForAdmin( HttpSession session,@RequestParam long id )
    {
    	
    	 session.setAttribute( "app1", applicationDao.getApplication(id) );
    	
    	 return "redirect:/application/viewForAdmin.html";
    }
    
}
