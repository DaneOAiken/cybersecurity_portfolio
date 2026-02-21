# Enterprise Domain Build 🔧

## Overview

**Project:** Deploy a fully functional Windows domain environment simulating a small business IT infrastructure
**Type:** Home Lab / System Administration
**Focus:** Active Directory, DNS, Group Policy, NTFS permissions, domain join, RBAC

---

## Table of Contents

| # | Section | What's Covered |
|:--|:--------|:---------------|
| 1 | [VMware Network Configuration](#1-vmware-network-configuration) | Isolated host-only network, subnet design |
| 2 | [Domain Controller Deployment](#2-domain-controller-deployment-dc01) | Static IP, DNS config |
| 3 | [AD DS Installation & Promotion](#3-active-directory-domain-services-installation) | Forest creation, DSRM, domain verification |
| 4 | [OU Structure Design](#4-organizational-unit-ou-design) | Enterprise OU hierarchy |
| 5 | [Security Groups & Users](#5-security-groups--user-provisioning) | RBAC model, admin account, department users |
| 6 | [File Shares & NTFS Hardening](#6-file-shares--ntfs-permission-hardening) | Dual-layer permissions, inheritance control |
| 7 | [Domain Join & Access Testing](#7-domain-join--access-control-validation) | Client setup, Kerberos auth, permission validation |
| 8 | [Troubleshooting](#8-troubleshooting--misconfigured-share-path) | Diagnosing and fixing a misconfigured share |

---

## Lab Architecture

```
┌──────────────────────────────────────────────────────────┐
│              VMnet2 — Host-Only Network                  │
│              Subnet: 192.168.10.0/24                     │
│              DHCP: Disabled                              │
│                                                          │
│   ┌──────────────────────┐    ┌─────────────────────┐    │
│   │  DC01                │    │  WS01               │    │
│   │  Windows Server 2025 │    │  Windows 11 Ent.    │    │
│   │  192.168.10.10       │    │  192.168.10.20      │    │
│   │  AD DS · DNS         │    │  Domain-joined      │    │
│   │  File Shares         │    │  6 GB RAM · 2 vCPU  │    │
│   │  6 GB RAM · 4 vCPU   │    │                     │    │
│   └──────────────────────┘    └─────────────────────┘    │
│            ▲                              │              │
│            └────── Kerberos · DNS ────────┘              │
└──────────────────────────────────────────────────────────┘
```

| Machine | OS | IP | Role |
|:--------|:---|:---|:-----|
| DC01 | Windows Server 2025 Datacenter (Eval) | 192.168.10.10 | Domain Controller, DNS, File Server |
| WS01 | Windows 11 Enterprise (Eval) | 192.168.10.20 | Domain-joined workstation |

---

## My Process

### 1) VMware Network Configuration

I created an isolated host-only network in VMware Workstation Pro to simulate an internal corporate LAN. DHCP was disabled so the Domain Controller handles all DNS resolution and IP addressing is manually controlled.

| Setting | Value |
|:--------|:------|
| Network | VMnet2 — Host-only |
| Subnet | 192.168.10.0 /24 |
| DHCP | Disabled |

---

### 2) Domain Controller Deployment (DC01)

I provisioned a Windows Server 2025 VM with 4 vCPUs and 6 GB RAM, then configured a static IP address. DNS points to itself because once AD DS is installed, this server becomes the authoritative DNS server for the domain.

```
IP Address:    192.168.10.10
Subnet Mask:   255.255.255.0
Gateway:       (none — isolated network)
DNS Server:    192.168.10.10  ← Points to itself
```

I verified the configuration with `ipconfig`:

<img src="assets/images/01_static_ip_ipconfig.png" alt="Static IP verified via ipconfig" width="500"/>

**Why DNS points to itself:** Active Directory is completely dependent on DNS for service location (SRV records). If DNS is misconfigured, domain promotion fails. This is the most common beginner mistake when setting up AD.

---

### 3) Active Directory Domain Services Installation

**i.** With the static IP confirmed, I installed the AD DS role through Server Manager → Add Roles and Features:

<img src="assets/images/02_adds_role_installed.png" alt="AD DS role installed in Server Manager" width="500"/>

**ii.** I promoted the server to a Domain Controller. I selected **Add a new forest** and set the root domain name to `corp.local`:

<img src="assets/images/03_new_forest_corp_local.png" alt="New forest creation — corp.local" width="500"/>

**iii.** I configured the Domain Controller options and set the DSRM recovery password:

<img src="assets/images/04_dc_options_dsrm.png" alt="Domain Controller options and DSRM password" width="500"/>

**iv.** After the server rebooted, the login screen confirmed the domain was live — showing `CORP\Administrator` instead of a local account:

<img src="assets/images/05_domain_login_screen.png" alt="CORP\Administrator login — domain is live" width="500"/>

**v.** I verified the domain was functioning by running `whoami` → `corp\administrator`.

---

### 4) Organizational Unit (OU) Design

Instead of using the default AD containers, I designed a realistic enterprise OU hierarchy that separates admin accounts, service accounts, workstations, servers, and departments. The underscore prefix keeps custom OUs sorted above default containers.

```
corp.local
 ├── _Admins
 │    └── itadmin (Domain Admins + IT_Admins)
 ├── _ServiceAccounts
 ├── _Workstations
 ├── _Servers
 ├── _Departments
 │    ├── HR         → jsmith, mgarcia
 │    ├── Finance    → rlee, ppatel
 │    ├── IT         → tnguyen, adavis
 │    └── Sales      → cjohnson, lmartin
 └── _SecurityGroups
      ├── HR_Share_Modify
      ├── Finance_Share_Modify
      ├── IT_Admins
      └── All_Employees
```

**i.** Here is the top-level OU structure inside Active Directory Users and Computers:

<img src="assets/images/06_ou_structure.png" alt="Enterprise OU structure in AD Users and Computers" width="500"/>

**ii.** And the department sub-OUs nested under `_Departments`:

<img src="assets/images/07_department_ous.png" alt="Department sub-OUs under _Departments" width="500"/>

---

### 5) Security Groups & User Provisioning

I created security groups **before** creating users — permissions always attach to groups, not individuals. This follows the Role-Based Access Control (RBAC) model used in enterprise environments.

| Group | Scope | Type | Purpose |
|:------|:------|:-----|:--------|
| HR_Share_Modify | Global | Security | HR file share access |
| Finance_Share_Modify | Global | Security | Finance file share access |
| IT_Admins | Global | Security | Elevated IT privileges |
| All_Employees | Global | Security | Company-wide read access |

**i.** All four groups created in the `_SecurityGroups` OU:

<img src="assets/images/08_security_groups.png" alt="Security groups in _SecurityGroups OU" width="500"/>

**ii.** I created a dedicated **itadmin** account in the `_Admins` OU and added it to both `Domain Admins` and `IT_Admins` — rather than using the built-in Administrator account. In production, the built-in Administrator is often disabled or renamed:

<img src="assets/images/09_itadmin_group_membership.png" alt="itadmin — Member Of showing Domain Admins + IT_Admins" width="500"/>

**iii.** Users were created in each department OU using enterprise naming format (first initial + last name), then added to their corresponding security groups:

<img src="assets/images/10_finance_group_members.png" alt="Finance security group with members populated" width="500"/>

---

### 6) File Shares & NTFS Permission Hardening

Each folder was configured with **both** share-level and NTFS permissions — most beginners only configure one layer.

**i.** I created a centralized file share structure at `C:\Shares` with department-level isolation:

<img src="assets/images/11_shares_folder_structure.png" alt="C:\Shares folder structure with HR, Finance, Public" width="500"/>

| Share | Security Group | Share Permission | NTFS Permission |
|:------|:---------------|:-----------------|:----------------|
| HR | HR_Share_Modify | Change + Read | Modify |
| Finance | Finance_Share_Modify | Change + Read | Modify |
| Public | All_Employees | Read | Read |

**ii.** I configured the HR share via Advanced Sharing, removing `Everyone` and adding only `HR_Share_Modify` with Change + Read:

<img src="assets/images/12_hr_share_permissions.png" alt="HR Advanced Sharing — HR_Share_Modify with Change + Read" width="500"/>

**iii.** For NTFS, I disabled inheritance (converting to explicit permissions), removed `CORP\Users`, and kept only **SYSTEM**, **Administrators**, **CREATOR OWNER**, and the department security group with Modify:

<img src="assets/images/13_hr_ntfs_hardened.png" alt="HR NTFS Security tab — inheritance disabled, least privilege applied" width="500"/>

**iv.** I repeated this process for Finance and Public (Public uses Read instead of Modify).

**Key concept:** Share permissions control network-level access, NTFS permissions control file system-level access. The effective (actual) permission is the **most restrictive** combination of both. This is what Help Desk technicians troubleshoot daily.

---

### 7) Domain Join & Access Control Validation

**i.** I deployed a Windows 11 Enterprise workstation (WS01) and configured static networking pointed at DC01 for DNS. I verified connectivity with `ipconfig /all` and `ping 192.168.10.10`:

<img src="assets/images/14_ws01_ipconfig_ping.png" alt="WS01 ipconfig showing 192.168.10.20 and successful ping to DC01" width="500"/>

**ii.** I joined the workstation to `corp.local` via `sysdm.cpl` using `corp\itadmin` credentials and received the domain welcome confirmation:

<img src="assets/images/15_domain_join_welcome.png" alt="Welcome to the corp.local domain" width="500"/>

**iii.** After rebooting, I logged in as domain user `corp\jsmith` (HR department) to test Kerberos authentication:

<img src="assets/images/16_domain_user_login.png" alt="Domain user login — John Smith on WS01" width="500"/>

**iv.** I navigated to `\\DC01` from File Explorer and confirmed all three shares were visible:

<img src="assets/images/17_network_shares_visible.png" alt="\\DC01 showing Finance, HR, Public network shares" width="500"/>

**v.** Opening the HR share — access granted as expected for an HR user:

<img src="assets/images/18_hr_share_access_granted.png" alt="HR share opened successfully — access granted for HR user" width="500"/>

**vi.** Attempting to open the Finance share — access denied, confirming department isolation:

<img src="assets/images/19_finance_access_denied.png" alt="Access denied on \\DC01\Finance — RBAC working correctly" width="500"/>

**vii.** Attempting to create a file in Public — write denied, confirming read-only enforcement:

<img src="assets/images/20_public_write_denied.png" alt="Public share — write access denied, read-only enforced" width="500"/>

**Test results summary:**

| Share | Expected | Result |
|:------|:---------|:-------|
| `\\DC01\HR` | Access granted | ✅ Access granted |
| `\\DC01\Finance` | Access denied | ✅ Access denied |
| `\\DC01\Public` | Read-only | ✅ Write denied |

---

### 8) Troubleshooting — Misconfigured Share Path

During testing, the HR share was exposing all department folders instead of just HR contents. I diagnosed the root cause and corrected it.

**Problem:** The HR share was pointing to `C:\Shares` (parent directory) instead of `C:\Shares\HR`, so opening `\\DC01\HR` showed Finance, HR, and Public folders.

**Resolution:**

**i.** Opened Shared Folders Manager: `fsmgmt.msc`

**ii.** Identified the incorrect share path under the Shares list

**iii.** Stopped sharing the misconfigured entry

**iv.** Re-shared `C:\Shares\HR` with correct permissions

**v.** Verified from WS01 — HR share now shows correct contents

This is the exact type of issue Help Desk and Tier 2 support resolves in production environments. Misconfigured shares can expose sensitive department data to unauthorized users.

---

## Key Findings

* Deployed a fully functional Windows domain with AD DS, DNS, and centralized file shares
* Designed an enterprise OU structure with proper separation of admin, user, and service accounts
* Implemented RBAC using security groups — permissions assigned to groups, never directly to users
* Configured dual-layer permissions (Share + NTFS) with inheritance disabled and least privilege enforced
* Successfully joined a Windows 11 workstation to the domain and validated Kerberos authentication
* Tested and confirmed department-level access isolation across all file shares
* Diagnosed and corrected a share misconfiguration using `fsmgmt.msc`

---

## Skills Demonstrated

* Windows Server administration (roles, features, promotion)
* Active Directory Domain Services (forests, OUs, users, groups)
* DNS configuration and troubleshooting
* Static IP addressing and network segmentation
* NTFS and share permission management
* Inheritance control and permission hardening
* Domain join and Kerberos authentication
* Troubleshooting with `fsmgmt.msc`, `ipconfig`, `whoami`, `ping`
* VMware Workstation Pro virtual networking

---

[← Back to Lab Overview](README.md) · [← Back to Portfolio](../README.md)
