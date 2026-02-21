# Active Directory Lab — Tier 1 Help Desk Ticket Simulation 🎫

## Overview

**Project:** Simulate real-world Tier 1 Help Desk ticket workflows using the existing `corp.local` domain environment
**Type:** Help Desk Operations / IT Support Simulation
**Focus:** Account lockout resolution, password resets, employee termination/offboarding, Group Policy enforcement

---

## Table of Contents

| # | Section | What's Covered |
|:--|:--------|:---------------|
| 1 | [Pre-Ticket Configuration](#1-pre-ticket-configuration--account-lockout-policy) | Identifying missing lockout policy, configuring GPO |
| 2 | [Ticket #001 — Account Lockout](#2-ticket-001--user-locked-out) | Triggering lockout, unlocking account, password reset, validation |
| 3 | [Ticket #002 — Employee Termination](#3-ticket-002--employee-termination-offboarding) | Disabling account, OU lifecycle management, group cleanup, access revocation |

---

## Prerequisites

This walkthrough continues from [Part 1 — Enterprise Domain Simulation](Active_Directory_Lab_Part1.md), which covers the full environment build. At this point, the lab has:

* DC01 promoted as Domain Controller for `corp.local`
* Enterprise OU structure with department sub-OUs (HR, Finance, IT, Sales)
* RBAC security groups with users assigned to department groups
* File shares configured with dual-layer Share + NTFS permissions
* WS01 domain-joined and access control validated

---

## My Process

### 1) Pre-Ticket Configuration — Account Lockout Policy

Before simulating any lockout tickets, I checked the Default Domain Policy and found that **no account lockout policy was configured** — the threshold was set to 0 invalid logon attempts. This is actually a common finding in environments where default settings haven't been hardened.

<img src="assets/images/21_no_lockout_policy_defined.png" width="500"/>

*Default Domain Policy showing Account Lockout Policy with no threshold defined — accounts cannot be locked out.*

I configured a proper lockout policy via Group Policy Management by editing the Default Domain Policy:

| Setting | Value |
|:--------|:------|
| Account lockout threshold | 5 invalid logon attempts |
| Account lockout duration | 15 minutes |
| Reset account lockout counter after | 15 minutes |
| Allow Administrator account lockout | Enabled |

<img src="assets/images/22_lockout_policy_configured.png" width="500"/>

*Account Lockout Policy configured with 5-attempt threshold, 15-minute lockout duration, and 15-minute reset counter.*

After configuring the policy, I forced a policy update on both DC01 and WS01:

```
gpupdate /force
```

Then verified propagation on the workstation using:

```
gpresult /r
```

This confirmed the Default Domain Policy was applied successfully to WS01.

---

### 2) Ticket #001 — User Locked Out

**Ticket:** `#001`
**User:** `corp\rlee` (Ryan Lee — Finance Department)
**Reported Issue:** "I'm locked out of my account."

---

#### Step 1 — Trigger the Lockout

On WS01, I logged out and attempted to sign in as `corp\rlee` with an incorrect password 5 times to trigger the lockout threshold.

After the fifth failed attempt, the workstation displayed the lockout message:

<img src="assets/images/23_account_locked_out_ws01.png" width="500"/>

*WS01 login screen confirming the account is locked out after 5 failed attempts — policy enforcement validated.*

---

#### Step 2 — Confirm Lockout in Active Directory

On DC01, I opened **Active Directory Users and Computers**, navigated to `_Departments → Finance`, and opened the properties for `rlee`.

The Account tab showed the lockout flag was set:

<img src="assets/images/24_unlock_account_aduc.png" width="500"/>

*Ryan Lee's account properties showing "Unlock account" checkbox — confirming the account is currently locked on this Domain Controller.*

---

#### Step 3 — Unlock Account and Reset Password

I checked the **Unlock account** box and clicked Apply to clear the lockout flag.

Then I right-clicked the user and selected **Reset Password**, set a temporary password, and checked **User must change password at next logon** — standard Tier 1 procedure:

<img src="assets/images/25_password_reset_dialog.png" width="500"/>

*Password reset dialog with "User must change password at next logon" enabled. Account lockout status shows Unlocked.*

---

#### Step 4 — Validate on Workstation

Back on WS01, I logged in as `corp\rlee` using the temporary password. Windows immediately prompted the user to change their password before signing in:

<img src="assets/images/26_forced_password_change.png" width="500"/>

*WS01 enforcing mandatory password change at next logon — confirming the reset policy is working correctly.*

After setting a new password, the user successfully logged into the desktop:

<img src="assets/images/27_successful_login_after_reset.png" width="500"/>

*Ryan Lee successfully authenticated on WS01 after account recovery — ticket resolved.*

---

#### Ticket #001 — Summary

| Step | Action | Tool |
|:-----|:-------|:-----|
| 1 | Triggered lockout (5 wrong passwords) | WS01 login screen |
| 2 | Verified locked status | ADUC → Account tab |
| 3 | Unlocked account | ADUC → Unlock account checkbox |
| 4 | Reset password with forced change | ADUC → Reset Password |
| 5 | Validated login + password change | WS01 domain login |

---

### 3) Ticket #002 — Employee Termination (Offboarding)

**Ticket:** `#002`
**User:** `corp\lmartin` (Leon Martin — Sales Department)
**Request from HR:** "Employee terminated effective immediately. Disable all access."

---

#### Step 1 — Confirm Pre-Termination State

On DC01, I opened ADUC and navigated to `_Departments → Sales` to confirm Leon Martin's account was active and present in the correct OU:

<img src="assets/images/28_pre_termination_active_user.png" width="500"/>

*Leon Martin listed as an active user in the Sales OU — pre-termination baseline documented.*

---

#### Step 2 — Disable the Account

I right-clicked Leon Martin's account and selected **Disable Account**. Active Directory confirmed the action:

<img src="assets/images/29_account_disabled_confirmation.png" width="500"/>

*AD DS confirmation dialog: "Object Leon Martin has been disabled." — immediate access revocation.*

---

#### Step 3 — Create Disabled Users OU and Move Account

Following enterprise best practice, I created a `_DisabledUsers` OU at the **root level** of `corp.local` — not inside `_Departments`, because disabled accounts should be separated from active business structure for clean GPO scoping, auditing, and lifecycle management.

I then moved Leon Martin's account into `_DisabledUsers`:

<img src="assets/images/30_moved_to_disabled_users_ou.png" width="500"/>

*Leon Martin moved to `_DisabledUsers` OU at the domain root — structured lifecycle management.*

The updated OU structure now includes:

```
corp.local
 ├── _Admins
 ├── _Departments
 │    ├── Finance
 │    ├── HR
 │    ├── IT
 │    └── Sales
 ├── _SecurityGroups
 ├── _Servers
 ├── _ServiceAccounts
 ├── _Workstations
 └── _DisabledUsers         ← Terminated accounts
      └── Leon Martin
```

---

#### Step 4 — Remove Group Memberships

I opened Leon Martin's properties and removed all security group memberships except **Domain Users** (which cannot be removed as the primary group). This prevents accidental reactivation with permissions still intact:

<img src="assets/images/31_cleaned_group_membership.png" width="500"/>

*Member Of tab showing only Domain Users remaining — all department and security group access revoked.*

---

#### Step 5 — Validate Access Denied on Workstation

On WS01, I attempted to log in as `corp\lmartin`. The workstation immediately rejected the login:

<img src="assets/images/32_disabled_account_login_denied.png" width="500"/>

*"Your account has been disabled. Please see your system administrator." — termination validated from the client side.*

---

#### Ticket #002 — Summary

| Step | Action | Tool |
|:-----|:-------|:-----|
| 1 | Documented active account state | ADUC → Sales OU |
| 2 | Disabled account | ADUC → Disable Account |
| 3 | Created `_DisabledUsers` OU at root | ADUC → New OU |
| 4 | Moved account to `_DisabledUsers` | ADUC → Move |
| 5 | Removed all group memberships | ADUC → Member Of tab |
| 6 | Validated login denied on WS01 | WS01 login screen |

---

## Key Takeaways

**Account Lockout Policy** — Windows domains ship with no lockout threshold by default. Identifying and configuring this via Group Policy before it becomes an issue is a proactive security measure that demonstrates understanding beyond basic account management.

**Cached Credentials** — During the DNS troubleshooting portion of this lab phase, I observed that domain users can still log in via cached credential hashes even when the DC is unreachable. This is important context for help desk techs: a successful login does not always mean domain connectivity is healthy.

**Offboarding Procedure** — In real environments, disabled accounts are never left in production OUs. Moving them to a dedicated `_DisabledUsers` OU at the domain root ensures clean GPO scoping, simplifies auditing, and prevents accidental reactivation with stale permissions.

---

## Skills Demonstrated

* Account lockout policy configuration via Group Policy
* GPO propagation verification with `gpupdate /force` and `gpresult /r`
* Account lockout detection, unlock, and password reset in ADUC
* Forced password rotation at next logon
* Employee termination / offboarding workflow
* OU lifecycle design (`_DisabledUsers` at domain root)
* Security group membership cleanup during offboarding
* Client-side validation of account state changes
* Understanding of cached credentials vs. live domain authentication

---

[← Back to Lab Overview](README.md) · [← Back to Portfolio](../README.md)
