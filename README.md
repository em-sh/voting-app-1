Here's a complete and clean **README.md** draft for your project setup:

---

# Voting App – CI/CD with AKS, GitHub, ArgoCD

## 📌 Project Overview

This project demonstrates a complete CI/CD setup using **Azure Kubernetes Service (AKS)**, **GitHub**, **Azure Pipelines**, and **ArgoCD**.

### Application Architecture

* 🟣 **Python Front-end Web App**: Allows users to vote between two options.
* 🔴 **Redis**: Collects new votes in real-time.
* 🟣 **.NET Worker Service**: Consumes votes from Redis and stores them.
* 🟣 **PostgreSQL Database**: Persists data, backed by a Docker volume.
* 🟣 **Node.js Results Web App**: Displays real-time voting results.

---

## ⚙️ CI Setup (Continuous Integration)

* ✅ Code hosted on **GitHub** (source of truth for both app code and Kubernetes manifests).
* ✅ **Azure Pipelines** integrated with GitHub.
* ✅ **CI Pipeline Workflow**:

  * Build multi-service Docker images.
  * Push images to **Azure Container Registry (ACR)**.
  * Run `updateK8sManifests.sh` to update image tags in Kubernetes YAML files.
  * Push updated manifests back to GitHub.

![Pipeline Diagram](https://trello.com/1/cards/684fb92660abb78c85761394/attachments/68789fa6dfedef26677fac54/download/image.png)

---

## 🚀 CD Setup (Continuous Deployment)

* ✅ **AKS Cluster** created on Azure with **VMSS Node Pools** for scalability and high availability.
* ✅ **ArgoCD** watches the GitHub repository for changes.
* ✅ On changes (new image tag commit), ArgoCD automatically updates the deployment in AKS without manual intervention.
* ✅ **Fully Automated CI/CD Pipeline** from code push to deployment.

---

## 📊 Architecture & Flow Diagrams

* **High-Level Architecture**
  ![Architecture](https://trello.com/1/cards/684fb92660abb78c85761394/attachments/6878a1fb86a5dfc4972ad69b/download/image.png)

* **CI/CD Workflow**
  ![CI/CD Flow](https://trello.com/1/cards/684fb92660abb78c85761394/attachments/6878a29b5a3f5591027274b4/download/image.png)

* **AKS Cluster Setup**
  ![AKS](https://trello.com/1/cards/684fb92660abb78c85761394/attachments/6878a2cabb30c8ff4c6d1e40/download/image.png)

* **End-to-End Pipeline Execution**
  ![Pipeline](https://trello.com/1/cards/684fb92660abb78c85761394/attachments/6878a6e9930beb769132797a/download/image.png)

---

## 📎 Useful Links

* [Azure DevOps Pipeline Setup Guide](https://dev.azure.com/)
* [ArgoCD Documentation](https://argo-cd.readthedocs.io/en/stable/)
* [AKS Documentation](https://learn.microsoft.com/en-us/azure/aks/)


---

## ✅ Summary

This project demonstrates a **vendor-agnostic CI/CD pipeline** using:

* GitHub for code management
* Azure Pipelines for CI
* ArgoCD for automated CD into AKS
* Clean GitOps workflow for transparency and control.

