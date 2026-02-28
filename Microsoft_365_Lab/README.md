# Microsoft 365 & Entra ID Administration Lab ☁️

Cloud-based identity and access management lab simulating a 10-user SMB environment on Microsoft 365 Business Premium, with Entra ID security controls, delegated RBAC, and real-world Help Desk incident simulations.

---

## 📖 Lab Walkthroughs

| Page | What's Covered |
|:-----|:---------------|
| [Tenant Setup & Identity Architecture](Tenant_Setup_and_Identity_Architecture.md) | M365 tenant provisioning, security groups, user onboarding, RBAC delegation, MFA enforcement |
| [Ticket #001 — Password Reset (Failed Sign-In)](Ticket_001_Password_Reset.md) | Authentication failure investigation, delegated password reset, sign-in & audit log verification |
| [Ticket #002 — Employee Offboarding](Ticket_002_Employee_Offboarding.md) | Sign-in block, credential reset, group removal, license reclamation, mailbox conversion, audit trail |

---

## 📋 Project Summary

This lab provisions and administers a Microsoft 365 Business Premium tenant for a simulated 10-user company (**Aiken IT Services**), demonstrating the cloud identity management and Help Desk workflows that most modern IT support roles handle daily. The environment is built entirely in Microsoft's cloud stack — Entra ID, Exchange Online, and the M365 Admin Center — with no on-premises infrastructure required.

**Identity Architecture:**

* Provisioned Microsoft 365 Business Premium tenant with 10 licensed users across 4 departments
* Created department-based security groups (HR-Access, Finance-Access, Sales-Access, IT-Access) for RBAC
* Clean naming convention using first initial + last name format (e.g., `rlee`, `ljames`)
* Delegated User Administrator role to IT staff and Helpdesk Administrator to support account
* Enforced MFA baseline via Microsoft-managed Conditional Access policies (Security Defaults)

**Help Desk Incident Simulations:**

* Investigated failed sign-in attempts using Entra ID sign-in logs
* Performed delegated password reset via Helpdesk Administrator role
* Verified remediation through audit log validation
* Executed full employee offboarding lifecycle: sign-in block, password reset, group removal, mailbox conversion to shared, license reclamation
* Validated containment by confirming blocked sign-in from user perspective
* Documented correct offboarding sequence (mailbox conversion before license removal)

---

## 🏗️ Lab Architecture

| Component | Details |
|:----------|:--------|
| **Tenant** | Microsoft 365 Business Premium (Trial) |
| **Domain** | `aikenitservices.onmicrosoft.com` |
| **Identity Provider** | Microsoft Entra ID (Azure AD) |
| **Users** | 10 licensed accounts across HR, Finance, Sales, IT |
| **Security** | MFA via Security Defaults, Conditional Access policies |
| **Admin Roles** | Global Admin, User Administrator, Helpdesk Administrator |
| **Services** | Exchange Online, Teams, SharePoint, Intune |

### Company Structure

| Department | Users | Security Group |
|:-----------|:------|:---------------|
| HR | Rachel Lee (`rlee`), Jimmy Butler (`jbutler`) | HR-Access |
| Finance | Jayson Tatum (`jtatum`), Nikola Jokic (`njokic`) | Finance-Access |
| Sales | Luka Doncic (`ldoncic`), Devin Booker (`dbooker`), Anthony Edwards (`aedwards`) | Sales-Access |
| IT | LeBron James (`ljames` — User Admin), IT Support (`support` — Helpdesk Admin) | IT-Access |

---

## ⚡ Skills Demonstrated

* Microsoft 365 Business Premium tenant administration
* Microsoft Entra ID (Azure AD) identity lifecycle management
* User provisioning with license assignment and department tagging
* Role-based access control (RBAC) via security groups and admin role delegation
* MFA enforcement through Security Defaults and Conditional Access policies
* Delegated password reset using Helpdesk Administrator role
* Sign-in log analysis and authentication failure investigation
* Audit log verification for compliance and traceability
* Employee offboarding workflow (sign-in block, credential reset, group cleanup, license reclamation, mailbox conversion)
* Correct offboarding sequence awareness (mailbox conversion before license removal)

---

[← Back to Portfolio](../README.md)
