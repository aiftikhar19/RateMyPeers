# RateMyPeers - infinite_loop


## Overview
 - Tool to helps students provide feedback for their teammates during
   group projects.
 - Instructors set up the groups and can see the ratings to help them
   quickly notice and address any issues in the class.

## About

 - Student benefits
	 - Make sure that good teammates get rewarded, and bad ones don't get a grade they didn’t earn.
	- Keep an overall rating that sticks around forever, and see other students' ratings when choosing a group.

- Instructor Benefits
	- Keep class running smoothly and be confident that students are getting the credit they earned.
	- Help discover problems as soon as they surface.

## Users

 - Instructor
	 - Create/read/update/delete classes & groups
	 - Add Students to classes and groups
	 - View evaluations created by students

- Student
	- View groups, classes, and other students
	- Create/update evaluations of group members
	- View overall score of other students

## Setup
To set up the server on your own machine, make sure you have rails 5.x and ruby 2.2.x installed.
Once you have everything downloaded from the repo, navigate to the project6 folder, and run: 

    $ rails db:drop db:create db:migrate

Then, to start the server:
    
    rails s
The server will now be running on your local machine. To view it, go to: localhost:3000
