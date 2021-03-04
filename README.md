# Project Overview

In this project, I'll develop and demonstrate my skills in using a variety of industry leading tools, especially Microsoft Azure, to create disposable test environments and run a variety of automated tests with the click of a button. Additionally, I'll monitor and provide insight into my application's behavior, and determine root causes by querying the application’s custom log files.

## Project Tools and Environment
I've become familiar with the following tools 

:white_check_mark:  Azure DevOps 

:white_check_mark:  Selenium

:white_check_mark:  Terraform

:white_check_mark:  JMeter

:white_check_mark:  Postman

I have `installed`, `set up`, `configured`, and used each of these during our lessons in this course. In this project I will apply all of them together, and demonstrate all of the skills and concepts I’ve learned with these tools in one project.

## Project Steps
Please complete the following steps for this project:

### 1. Use Terraform to create the following resources for a specific environment tier:
Resource Created with Terraform | Done
:--- | :---:
AppService | :white_check_mark:
Network | :white_check_mark:
Network Security Group | :white_check_mark:
Public IP | :white_check_mark:
Resource Group | :white_check_mark:
Linux VM (created using Packer -- using a Standard_B1s size for lowest cost) | :white_check_mark:

[![Build Status](https://dev.azure.com/project2769/tf-azure-projects/_apis/build/status/corneyc.Project-3?branchName=main)](https://dev.azure.com/project2769/tf-azure-projects/_build/latest?definitionId=2&branchName=main)
[![CI](https://github.com/corneyc/Project-3/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/corneyc/Project-3/actions/workflows/main.yml)

I followed the instructions provided  in the `Project Starter Resources` brief folder:
- [x] I began by opening the files in the Project Starter Resources folder using the IDE of your choice.![directories](https://github.com/corneyc/Project-3/blob/main/images/terraform_4.png)
- [x] I completed the `"Getting Started,”` and each of the "Installation" sections.
- [x] I went on to create an `SSH key pair`- ``ssh-keygen -m PEM -t rsa -b 4096`` for the linux machine. I used the reference to the file for the `Dev Environment`. I also used the actual public key itself when using Terraform in the CI/CD pipeline.
- [x] Lastly, I ran the terraform commands to create the resources in Azure ``(init,plan,apply)``.

The following screenshots illustrate the `State backend and the Service Principal`configured and terraform commands ran.

![backend](https://github.com/corneyc/Project-3/blob/main/images/terraform_backend_5.png)

![s_principal](https://github.com/corneyc/Project-3/blob/main/images/Terraform_6.png)

![build/ci/cd](https://github.com/corneyc/Project-3/blob/main/images/ss_1.png)

![build](https://github.com/corneyc/Project-3/blob/main/images/ss_2.png)

![deploy web app](https://github.com/corneyc/Project-3/blob/main/images/ss_3.png)





### 2. For the Azure DevOps CI/CD pipeline:

 -:white_check_mark:  Create the tasks that allow for Terraform to run and create the above resources.
 
 -:white_check_mark: Execute Test Suites for:
 
    - Postman - runs during build stage
    
    ![Postman](https://github.com/corneyc/Project-3/blob/main/images/install postman.png)
    
    - Selenium - runs on the linux VM in the deployment stage
    
    ![Selenium](https://github.com/corneyc/Project-3/blob/main/images/install selenium.png)
    
    - JMeter - runs against the AppService in the deployment stage
    
    ![Jmeter]()

### 3. For Postman:
- Create a Regression Test Suite from the Starter APIs. Use the Publish Test Results task to publish the test results to Azure Pipelines.
- Create a Data Validation Test Suite from the Starter APIs.

### 4. For Selenium:
- Create a UI Test Suite that adds all products to a cart, and then removes them.
- Include print() commands throughout the tests so the actions of the tests can easily be determined. E.g. A login function might return which user is attempting to log in and whether or not the outcome was successful.
- Deploy the UI Test Suite to the linux VM and execute the Test Suite via the CI/CD pipeline.

### 5. For JMeter:
- Use the starter APIs to create two Test Suites. Using variables, reference a data set (csv file) in the test cases where the data will change.
- Create a Stress Test Suite
- Create a Endurance Test Suite
- Generate the HTML report (non-CI/CD) IMPORTANT: Since the AppService is using the Basic/Free plan, start small (2 users max) and once you are ready for the final submission, use up to 30 users for a max duration of 60 seconds. The "Data Out" quota for the AppService on this plan is only 165 MiB.

### 6. For Azure Monitor:
- Configure an Action Group (email)
- Configure an alert to trigger given a condition from the AppService
- The time the alert triggers and the time the Performance test is executed ought to be very close.

### 7. Direct the output of the Selenium Test Suite to a log file, and execute the Test Suite. Configure custom logging in Azure Monitor to ingest this log file.This may be done non-CI/CD.
