# Voting App – CI/CD with AKS, GitHub, ArgoCD

##  Project Overview

This project demonstrates a complete CI/CD setup using **Azure Kubernetes Service (AKS)**, **GitHub**, **Azure Pipelines**, and **ArgoCD**.

### Application Architecture

* 🟣 **Python Front-end Web App**: Allows users to vote between two options.
* 🔴 **Redis**: Collects new votes in real-time.
* 🟣 **.NET Worker Service**: Consumes votes from Redis and stores them.
* 🟣 **PostgreSQL Database**: Persists data, backed by a Docker volume.
* 🟣 **Node.js Results Web App**: Displays real-time voting results.

## ⚙️ CI Setup (Continuous Integration)

*  Code hosted on **GitHub** (source of truth for both app code and Kubernetes manifests).
*  **Azure Pipelines** integrated with GitHub.
*  **CI Pipeline Workflow**:

  * Build multi-service Docker images.
  * Push images to **Azure Container Registry (ACR)**.
  * Run `updateK8sManifests.sh` to update image tags in Kubernetes YAML files.
  * Push updated manifests back to GitHub.

![Pipeline Diagram](https://github.com/em-sh/voting-app-1/blob/main/pipelines.png)

##  CD Setup (Continuous Deployment)

*  **AKS Cluster** created on Azure with **VMSS Node Pools** for scalability and high availability.
*  **ArgoCD** watches the GitHub repository for changes.
*  On changes (new image tag commit), ArgoCD automatically updates the deployment in AKS without manual intervention.
*  **Fully Automated CI/CD Pipeline** from code push to deployment.

## 📊 Architecture & Flow Diagrams

* **High-Level Architecture**
![alt text](https://github.com/em-sh/voting-app-1/blob/main/CI-CD-workflow.jpg "High-Level Architecture")

* **End-to-End Pipeline Execution**
  ![Pipeline](https://github.com/em-sh/voting-app-1/blob/main/End-to-End%20Pipeline%20Execution.png)

* **ArgoCD Setup**
  ![AKS](https://github.com/em-sh/voting-app-1/blob/main/ArgoCD-Status.png)

## 📎 Useful Links

* [Azure DevOps Pipeline Setup Guide](https://dev.azure.com/)
* [ArgoCD Documentation](https://argo-cd.readthedocs.io/en/stable/)
* [AKS Documentation](https://learn.microsoft.com/en-us/azure/aks/)
* [Tutorial](https://www.youtube.com/watch?v=dmGW22W3VOs)

## ✅ Summary

This project demonstrates a **vendor-agnostic CI/CD pipeline** using:

* GitHub for code management
* Azure Pipelines for CI
* ArgoCD for automated CD into AKS
* Clean GitOps workflow for transparency and control.

