# Active Directory Lab 🔧

Enterprise domain simulation built on VMware Workstation Pro, modeling a small business Windows environment with centralized authentication, role-based access control, and department-level file share isolation.

---

## 📖 [View the Full Lab Walkthrough →](Active_Directory_Lab_Part1.md)

---

## 📋 Project Summary

This lab deploys a fully functional `corp.local` domain from scratch — a Windows Server 2025 Domain Controller managing DNS, Active Directory, and file shares, with a domain-joined Windows 11 workstation used to validate the entire configuration. The environment is designed to reflect real-world enterprise IT infrastructure and demonstrate the core skills used in Help Desk and System Administration roles.

**What's built so far:**

* Windows Server 2025 promoted to Domain Controller with AD DS and DNS
* Enterprise OU structure separating admins, departments, service accounts, workstations, and servers
* RBAC security model using Global Security Groups — permissions assigned to groups, never users
* Dedicated admin account (itadmin) instead of built-in Administrator
* Centralized file shares (`C:\Shares`) with dual-layer Share + NTFS permissions
* NTFS inheritance disabled and hardened to enforce least privilege
* Windows 11 Enterprise workstation joined to domain with Kerberos authentication verified
* Department-level access control tested and validated end-to-end
* Real troubleshooting: diagnosed and corrected a misconfigured share path via `fsmgmt.msc`

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

* Group Policy Objects (account lockout, user restrictions, drive mapping)
* PowerShell automation (bulk user provisioning via CSV)
* Help Desk ticket simulation (password resets, account unlocks, GPO troubleshooting)
* Event Viewer log analysis
* Second Domain Controller for redundancy

---

## ⚡ Skills Demonstrated

* Windows Server administration & AD DS deployment
* Enterprise OU design and role-based access control
* Share + NTFS dual-layer permission hardening
* Domain join, Kerberos authentication, DNS
* Troubleshooting with fsmgmt.msc, ipconfig, gpresult
* VMware Workstation Pro virtual networking

---

[← Back to Portfolio](../README.md)
