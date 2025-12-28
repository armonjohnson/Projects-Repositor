# GlobalMart – React Ecommerce CI/CD on AWS

## BUILD FORMAT PROJECT README

---

## **B — Background**

Modern production applications require **automated, repeatable, and reliable deployments**. Manual deployments via SSH or SCP do not scale and introduce risk. This project was built to simulate a **real-world cloud production environment** where application changes flow automatically from GitHub to a live EC2-hosted website.

**GlobalMart** is a React-based eCommerce frontend deployed using AWS-native CI/CD services. The focus of this project is not just the UI, but the **infrastructure, automation, and deployment lifecycle** behind it.

This project mirrors workflows used by Cloud Support Engineers, DevOps Engineers, and Solutions Architects in production AWS environments.

---

## **U — Understanding the Problem**

Key challenges addressed:

* How do you automatically deploy frontend changes to EC2?
* How do you ensure builds are production-ready?
* How do you manage deployments without downtime or manual steps?
* How do you integrate GitHub with AWS CI/CD services securely?
* How do you serve a React SPA correctly using NGINX?

The goal was to design an **end-to-end CI/CD pipeline** that handles these concerns using best practices.

---

## **I — Implementation**

### Architecture Overview

**Tech Stack**

* Frontend: React (Production Build)
* Web Server: NGINX
* Compute: Amazon EC2 (Amazon Linux)
* CI/CD: AWS CodePipeline, CodeBuild, CodeDeploy
* Source Control: GitHub (OAuth integration)
* IAM: Least-privilege service roles

**Deployment Type:** In-place EC2 deployment

---

### CI/CD Pipeline Flow

#### 1. Source Stage – GitHub

* GitHub repository connected to AWS CodePipeline via OAuth
* Any push to the repository triggers the pipeline automatically
* Source artifacts are passed to CodeBuild

📸 *CodePipeline – Source Stage*
<img width="1920" height="1200" alt="Screenshot 2025-12-27 161028" src="https://github.com/user-attachments/assets/b789ab88-084b-46d1-b70c-8d7c6724fd25" />



---

#### 2. Build Stage – AWS CodeBuild

**What happens during build:**

* Dependencies are installed
* React application is compiled into an optimized production build
* Static assets are generated in the `/build` directory

**What I configured:**

* Build commands to produce a production-ready React bundle
* Artifact packaging for CodeDeploy consumption
* Validation through CodeBuild logs

---

#### 3. Deploy Stage – AWS CodeDeploy

**Deployment Configuration:**

* Application: `GlobalMart-Catalog`
* Deployment Group: `GlobalMart-Production`
* Target: EC2 instance tagged `GlobalMart-WebServer`
* Deployment Type: In-place

**Deployment Actions:**

* Artifacts copied to EC2 web directory
* NGINX restarted to serve the new build
* No manual SSH deployment required

📸 *CodeDeploy Deployment Group*

<img width="1920" height="1200" alt="Screenshot 2025-12-04 095233" src="https://github.com/user-attachments/assets/c9e77155-f065-4642-8c7f-73e479e4ca14" />

---

### EC2 & NGINX Setup

#### EC2 Configuration

* Amazon Linux EC2 instance
* CodeDeploy agent installed and running
* IAM instance role attached for CodeDeploy access

#### NGINX Configuration

* Installed and configured to serve React static files
* Default NGINX page validated during setup
* React app replaces default site after deployment

📸 *NGINX Default Page (Initial Validation)*

<img width="1920" height="1200" alt="Screenshot 2025-12-04 073332" src="https://github.com/user-attachments/assets/3b320448-0374-4d75-997a-4c9c9da98cef" />

📸 *Live React Ecommerce Application*

<img width="1920" height="1200" alt="Screenshot 2025-12-27 165438" src="https://github.com/user-attachments/assets/63c2fee0-3b23-4397-b21f-1166a0cf2b7b" />


---

## **L — Learning & Outcomes**

### Skills Demonstrated

* ✅ End-to-end AWS CI/CD pipeline design
* ✅ GitHub → CodePipeline → CodeBuild → CodeDeploy integration
* ✅ In-place EC2 deployments using CodeDeploy
* ✅ NGINX configuration for React SPAs
* ✅ IAM roles and least-privilege access
* ✅ Debugging pipeline, build, and deployment issues

### Key Takeaways

* CI/CD automation drastically reduces deployment risk
* AWS-native tools integrate cleanly when IAM is configured correctly
* React SPAs require proper NGINX configuration for routing
* CodeDeploy enables safe, repeatable EC2 deployments without manual intervention

---

## **D — Documentation & Validation**

### Application Features

* Product catalog with categories
* Client-side routing (Home, Products, About, Contact)
* Cart functionality
* Responsive UI

📸 *React Ecommerce UI*

<img width="1920" height="1200" alt="Screenshot 2025-12-27 183921" src="https://github.com/user-attachments/assets/fc9e7fc1-b6e6-473c-bd41-324797cb4b70" />

### Deployment Validation

* Verified NGINX default page before deployment
* Confirmed React app loads via EC2 public IP
* Confirmed pipeline succeeds end-to-end after GitHub commits

---

## Why This Project Matters

This project demonstrates **real production cloud engineering practices**, not just application development. It highlights skills directly relevant to:

* Cloud Support Engineer
* DevOps Engineer
* AWS Solutions Architect

It proves hands-on experience with **automation, deployment, infrastructure, and troubleshooting** in AWS.

---

## Author

**Armon Johnson**
Cloud / DevOps Engineer in Progress ☁️🚀

---

⭐ If you found this project useful, feel free to star the repository!

