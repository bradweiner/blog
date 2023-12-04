---
title: 'Data Science on Campus: One Year Retrospective'
author: "Brad"
date: "2020-10-26"
slug: "covid-19-on-campus-data-science-edition"
output:
  html_document:
    df_print: paged
categories:
- highered
- covid19
- cuboulder
tags:
- datascience
- covid19
subtitle: ''
summary: ''
authors: []
lastmod: "2020-10-26T15:20:19-06:00"
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---


### Introduction

When I was a grad student in Nashville, my office just happened to be in the student health center. The shortest path between my apartment and my office was walking through lobby of the Vanderbilt Children's Hospital. I made this walk nearly every day and routinely saw young kids with all manner of ailments.

Then, later in the day, I would inevitably be in some meeting about something that was comparatively unimportant. I think that photographers and philosophers call this "perspective". Don't get me wrong, I am very proud of the work I've done on behalf of college students and stand by the evidence that earning a college degree is a critical economic ladder in America.

Still, I've said it before and I'll say it again: I am not saving lives.

This remains true, but over the last year, there have been real-world health implications for a everyone working on campus, including those who do systematic and strategic data work on behalf of the institution. 

This piece is intended to highlight some of that work, and the ways that data science techiques played out in the operation of a University under extremely trying and unprecedented circumstances.

### COVID-19 On Campus

More than enough ink and pixels have been dedicated to higher education's response the COVID-19 pandemic. I won't rehash that debate here, but to put it succinctly, colleges and universities, particularly those with strong dependency on tuition, were under enormous financial and political pressure to open up complete with in-person classes.

To my knowledge, much less has been written about the actual mechanics of the institutional response and the required public health reporting. So in this blog, I am going to highlight a few of the COVID-19-related projects that were immediately pressing when I started back on campus a year ago.

To be clear, I wasn't directly involved with most of these efforts and don't want to appear to be taking credit. 

### Living/Learning Cohort Construction

One approach to reducing the spread of a contagious virus is to limit the number of people with whom one is in contact. This basic premise resulted in the idea of "cohorting" students into distinct groups who would not interact with other cohorts.

This idea was proposed at all educational levels and became something of a go-to strategy for pre-K and elementary school kids. According to Google Trends, "cohort" reached its peak searchiness during the return-to-school week of August 30 - Sep, 5, 2020. 

This seems like good epidemiological practice, and practically speaking, it might be relatively easy to administer for elementary school children. Just keep a single group of students in the same class all day and have the teachers rotate through. Have specific lunch and passing periods with minimal mingling and _voila!_ cohorts!

For college students, this turns into a potentially unsolvable combinatorial optimization problem not unlike the famous traveling salesman, Santa's sleigh, or baseball scheduling problems. One of my colleagues was asked to group students first by residence hall, then floor, then by similar course-taking patterns. Given the vast number of courses and available times, the number of combinations is enormous. Beyond that each constraint places substantial limitations on whether this problem is actually solvable.

Initially, my colleague approached this in the way that any data scientist might. As an optimization problem. But, it soon became clear that with shifting parameters and unknown constraints, it made sense to do the work manually, as a team exercise akin to selection committee or fantasy baseball draft. 

This couldn't have been easy or fun, but it was necessary to deliver on the requirements for a public health request intended to minimize contact between college students.

As far as COVID-19 protocols go, this presents a real opportunity for higher education. Course scheduling is an extremely complex process and it remains to be seen whether we can align scheduling and resources, at scale, for students who have preferences and work schedules and latent external constraints. Nevertheless, I am confident that with the right incentives (for example, more granular tuition pricing structures), this type of approach could leverage both the known peer effects of cohorts to also solve known space allocation issues.

### The Disappearance of Standardized Testing

One of the most complicated efforts of the year was figuring out the various places where standardized entrance examination scores were used as inputs, and finding new ways to get similar outputs. 

I spent considerable time trying to find reasonable subsittutes for SAT and ACT, particularly in the scholarship awarding process.

The first step, was trying to understand what other schools were doing, and interestingly, the advice from various educational consultancies was to jettison test scores altogether and _solely_ use GPA. I plan to write a complete _other_ blog on the many ways in which GPA fails as a standaridzed, or broadly generalizable measure. But, suffice it to say, I found that advice to be flimsy and poorly thought through.

To be clear, I am not a proponent of standardized tests in most cases. They are highly correlated with income, and broadly speaking, do not measure anything close to what people think they do. Nevertheless, the scholarship awarding processes at many large public Universities relied on them prior to the pandemic, and it seemed fair and reasonable to attempt the creation of _something_ that would provide some internal, year-over-year consistency.

Although I can't go into the exact details of what went into the scholarship awarding process, it was a very interesting exercise to see what data points existed for incoming students, and then finding ones that were the most consistent and lease sparse. The pickings were very slim, to be sure, but ultimately, we landed on a multivariate approach that took in the data points that were available, created a single, weighted score, and then rank ordered scholarship recipients. 

Like most pandemic hacks, it was imperfect. But, I was proud of the institutional ability to pivot quickly, to find a workable solution, and make sure that scholarships were awarded to students in a similar fashion, over a similar timescale.

### Dashboards and Case Reporting

Another key element of pandemic data work involved the mandatory reporting of COVID cases to various city and state agencies. This was easily the most visible of efforts because the institution needed up-to-date data on the number of new infections, the number of students in isolation spaces, and the total number of infections over time. This later included information on vaccinations and other key performance indicators. As a city within a city with tens of thousands of people coming to campus every day, providing this data was necessary and important.

Getting this handled was no easy task due to the absurd data friction both from upstream health care data systems and downstream enforcement of strict data models. Not surprisingly, much of this work was happening manually and on a daily basis. 

To me, these are some of the most fun data science problems because the value is obvious and demonstrable. Indeed, I spent two hours with some data reporters around campus to learn exactly what their processes were. Sadly, (yet not surprisingly) it was a lot of point-and-click column moving and renaming in Excel, carried out by overworked, and underpaid educational administrators who were doing the best with what they had under terrible circumstances.

To pitch in, I met with some of these stakeholders to learn about their processes and what could possibly be automated. This was, of course, complicated by HPPA requirements. Since I was not officially in a capacity to have access to individual medical information, we quickly settled on a process of building out synthetic data sets which could be used for testing, but didn't require the transmission of sensitive data to which I was not allowed access.

Ulitmately, I wrote about 30 lines of `tidyverse` code, then trained a few data reporters how to open their files, properly name them, and then run the code on their own. The pipeline automatically saved files with the correct name, and pushed them into the appropriate folders for upload. 

This project was hardly rocket surgery, but I am proud to have helped out some colleagues with a basic automation task. This enabled them to free up time for higher value, less tediouos work.

### Conclusion

The COVID-19 pandemic was, and remains, one of the most difficult and complicated external shocks to our educational system, our economy, and our entire way of life. There were many new challenges that arose on campus, and we had to work through a variety of technical and logistical challenges to keep campuses open, to provide positive academic experiences and keep our community safe.

In retrospect, the most important things we learned is that college campuses, can, under extreme circumstances rally together rapidly to innovate. The biggest concern (which is proving to be true) is that college campuses fall back into their ancient (they are 1000 year old organizations so, yes, I mean _ancient_ literally) ways of decentralized, consensus-building, decision-making habits which will not serve institutions well as new challenges emerge.
