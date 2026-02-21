# Active Directory Lab 🔧

Enterprise domain simulation built on VMware Workstation Pro, modeling a small business Windows environment with centralized authentication, role-based access control, and department-level file share isolation.

---

## 📖 Lab Walkthroughs

| Page | What's Covered |
|:-----|:---------------|
| [Enterprise Domain Build](Enterprise_Domain_Build.md) | DC deployment, OU design, RBAC, file shares, NTFS hardening, domain join |
| [Ticket #001 — Account Lockout & Password Reset](Ticket_001_Account_Lockout.md) | Lockout policy config, account unlock, password reset, validation |
| [Ticket #002 — Employee Termination](Ticket_002_Employee_Termination.md) | Account disablement, OU lifecycle, group cleanup, access revocation |

---

## 📋 Project Summary

This lab deploys a fully functional `corp.local` domain from scratch — a Windows Server 2025 Domain Controller managing DNS, Active Directory, and file shares, with a domain-joined Windows 11 workstation used to validate the entire configuration. The environment is designed to reflect real-world enterprise IT infrastructure and demonstrate the core skills used in Help Desk and System Administration roles.

**Infrastructure:**

* Windows Server 2025 promoted to Domain Controller with AD DS and DNS
* Enterprise OU structure separating admins, departments, service accounts, workstations, and servers
* RBAC security model using Global Security Groups — permissions assigned to groups, never users
* Dedicated admin account (itadmin) instead of built-in Administrator
* Centralized file shares (`C:\Shares`) with dual-layer Share + NTFS permissions
* NTFS inheritance disabled and hardened to enforce least privilege
* Windows 11 Enterprise workstation joined to domain with Kerberos authentication verified
* Department-level access control tested and validated end-to-end
* Real troubleshooting: diagnosed and corrected a misconfigured share path via `fsmgmt.msc`

**Help Desk Ticket Simulations:**

* Identified missing account lockout policy and configured 5-attempt threshold via GPO
* Simulated account lockout, performed unlock and secure password reset in ADUC
* Validated forced password change and successful login on domain workstation
* Executed employee termination workflow: disable, move to `_DisabledUsers` OU, strip group memberships
* Validated access revocation from client side

---

## 🏗️ Lab Architecture

| Machine | OS | IP | Role |
|:--------|:---|:---|:-----|
| DC01 | Windows Server 2025 Datacenter | 192.168.10.10 | Domain Controller, DNS, File Server |
| WS01 | Windows 11 Enterprise | 192.168.10.20 | Domain-joined workstation |

**Network:** VMnet2 (Host-only) · 192.168.10.0/24 · DHCP disabled

---

## 🔜 Planned Additions

This is an ongoing project. Next steps include:

* Drive mapping via Group Policy
* User restriction GPOs (disable Control Panel, block USB storage)
* PowerShell automation (bulk user provisioning via CSV)
* Additional ticket simulations (permissions troubleshooting, GPO not applying)
* Event Viewer log analysis
* Second Domain Controller for redundancy

---

## ⚡ Skills Demonstrated

* Windows Server administration & AD DS deployment
* Enterprise OU design and role-based access control
* Share + NTFS dual-layer permission hardening
* Domain join, Kerberos authentication, DNS
* Account lockout policy configuration via Group Policy
* Account lifecycle management (lockout, reset, termination)
* GPO propagation verification with gpupdate and gpresult
* Troubleshooting with fsmgmt.msc, ipconfig, nslookup, nltest
* VMware Workstation Pro virtual networking

---

[← Back to Portfolio](../README.md)
