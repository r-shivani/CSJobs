package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
@SessionAttributes("application")
public class ApplicationControllerS {

    @Autowired
    private JobDao jobDao;

    @Autowired
	private UserDao userDao;

    
    @Autowired
    private ApplicationDao applicationDao;

    @Autowired
	private ServletContext context;

	private File getFileDirectory() {
		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);
	}

    
	
	  @RequestMapping(value = "/application/reapply.html")
	    public String apply( HttpSession session,@RequestParam Long jobId )
	    {
	    	
	    	 session.setAttribute( "JOB", jobDao.getJob(jobId) );
	    	 return "redirect:/application/apply.html";
	    }
	    
	
	
	
    @RequestMapping(value = "/application/apply.html", method = RequestMethod.GET)
	public String apply( HttpSession session,
			ModelMap models) {
    	
    	Job JOB = (Job) session
 	            .getAttribute( "JOB" );
		Job job = jobDao.getJob(JOB.getId());
		User applicant = (User) session.getAttribute("authenticatedUser");
		Application application = applicationDao.getApplication(job, applicant);

		if (application != null && application.isSubmitted()) {
			models.put("errorCode", "error.application.submitted");
			return "error";
		}

		if (application == null)
			application = new Application(job, applicant);

		models.put("job", job);
		models.put("applicant", applicant);
		models.put("application", application);
		return "application/apply";
	}

	@RequestMapping(value = "/application/apply.html", method = RequestMethod.POST)
	public String apply(HttpSession session,@RequestParam String currentJobTitle,
			@RequestParam String currentJobInstitution,
			@RequestParam String currentJobYear,
			@RequestParam MultipartFile cv,
			@RequestParam MultipartFile researchStatement,
			@RequestParam MultipartFile teachingStatement,
			@RequestParam long jobId, @RequestParam long applicantId,
			SessionStatus sessionStatus) throws IllegalStateException,
			IOException {
		Job job = jobDao.getJob(jobId);
		User applicant = userDao.getUser(applicantId);
		Application application = new Application(job, applicant);

		if(!cv.isEmpty() &&cv.getSize()!=0 )
		{
		csjobs.model.File file1 = new csjobs.model.File();
		file1.setName(cv.getOriginalFilename());
		file1.setSize(cv.getSize());
		file1.setType(cv.getContentType());
		file1.setDate(new Date());
		file1.setOwner(applicant);
		file1=applicationDao.saveFile(file1);
		file1.setName(file1.getId()+file1.getName());
		file1=applicationDao.saveFile(file1);
		application.setCv(file1);
		cv.transferTo(new File(getFileDirectory(), file1.getName()));
		}

		if(!researchStatement.isEmpty() &&researchStatement.getSize()!=0 )
		{
		csjobs.model.File file2 = new csjobs.model.File();
		file2.setName(researchStatement.getOriginalFilename());
		file2.setSize(researchStatement.getSize());
		file2.setType(researchStatement.getContentType());
		file2.setDate(new Date());
		file2.setOwner(applicant);
		file2= applicationDao.saveFile(file2);
		file2.setName(file2.getId()+file2.getName());
		file2=applicationDao.saveFile(file2);
		application.setResearchStatement(file2);
		researchStatement.transferTo(new File(getFileDirectory(),
				file2.getName()));
		}

		if(!teachingStatement.isEmpty() &&teachingStatement.getSize()!=0 )
		{
		csjobs.model.File file3 = new csjobs.model.File();
		file3.setName(teachingStatement.getOriginalFilename());
		file3.setSize(teachingStatement.getSize());
		file3.setType(teachingStatement.getContentType());
		file3.setDate(new Date());
		file3.setOwner(applicant);
		file3 = applicationDao.saveFile(file3);
		file3.setName(file3.getId()+file3.getName());
		file3=applicationDao.saveFile(file3);
		application.setTeachingStatement(file3);
		teachingStatement.transferTo(new File(getFileDirectory(),
				file3.getName()));
		
		}
		application = applicationDao.saveApplication(application);
		 session.setAttribute( "currentapplication", application );
		sessionStatus.setComplete();
		return "redirect:addDegree.html";
	}
    
    
    @RequestMapping(value = "/application/addDegree.html",
        method = RequestMethod.GET)
    public String addDegree( HttpSession session, ModelMap models )
    {
    	Application currentapplication = (Application) session
	            .getAttribute( "currentapplication" );
        models.put( "application",
            applicationDao.getApplication( currentapplication.getId() ) );
        models.put( "degree", new Degree() );
        return "application/addDegree";
    }

    @RequestMapping(value = "/application/addDegree.html",
        method = RequestMethod.POST)
    public String addDegree( HttpSession session,@ModelAttribute Application application,
        @ModelAttribute Degree degree, SessionStatus sessionStatus )
    {
        application.getDegrees().add( degree );
        application = applicationDao.saveApplication( application );
        session.setAttribute( "currentapplication", application );
        sessionStatus.setComplete();
        return "redirect:addDegree.html" ;
    }
    
    @RequestMapping(value = "/application/download.html")
	public String download(HttpServletResponse response, @RequestParam Long fileId) throws IOException {
		csjobs.model.File file = applicationDao.getFile(fileId);
		response.setContentType(file.getType());
		response.setHeader("Content-Disposition", "inline; filename="+file.getName());
		FileInputStream in = new FileInputStream(new File(getFileDirectory(),
				file.getName()));
		OutputStream out = response.getOutputStream();

		byte buffer[] = new byte[2048];
		int bytesRead;

		while ((bytesRead = in.read(buffer)) > 0) {
			out.write(buffer, 0, bytesRead);
		}
		in.close();
		return null;

	}
    
    
    @RequestMapping(value = "/reviewer/reviewerview.html", method = RequestMethod.GET)
    public String reviewerview( HttpSession session,ModelMap models )
    {
    	 Job rejob = (Job) session
 	            .getAttribute( "rejob" );
    	 
    	 Job job=jobDao.getJob(rejob.getId());
    	
    	    		     		 
    	    	models.put("finalapplication", job.getApplications());
        return "/reviewer/reviewerview";
    }

    @RequestMapping(value = "/reviewer/rereviewerview.html", method = RequestMethod.GET)
    public String reviewerview1( HttpSession session,@RequestParam long id )
    {
    	
    	 session.setAttribute( "rejob", jobDao.getJob(id) );

    	  	
        return "redirect:/reviewer/reviewerview.html";
    }

}
