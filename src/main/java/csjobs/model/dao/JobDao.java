package csjobs.model.dao;

import java.util.List;

import csjobs.model.Job;
import csjobs.model.User;

public interface JobDao {

    Job getJob( Long id );

    List<Job> getJobs();

    List<Job> getOpenJobs();

    Job saveJob( Job job );

	 List<Job> reviewerjob(User user);

}
