# Splunk Home Labs 🔍

Hands-on SIEM analysis and threat detection using Splunk Enterprise. Each lab mirrors real-world SOC analyst workflows including log ingestion, SPL query development, dashboard creation, and alert configuration.

---

## 📂 Labs

| Lab | Focus | Key Skills |
|:----|:------|:-----------|
| [SSH Brute Force Detection](SSH_Brute_Force_Detection.md) | Authentication attack detection | JSON parsing, IP analysis, alerting |
| [OWASP Juice Shop Analysis](Detecting_Web_Application_Attacks_in_OWASP_Juice_Shop_Logs.md) | Web application attack detection | SQLi, XSS, traversal detection |

---

## 🔒 Lab 1: SSH Brute Force Detection

**Dataset:** Kaggle SSH Brute Force JSON logs

- Parsed JSON into fields (`foreign_ip`, `username`, `timestamp`)
- Built searches for IP counts, username counts, and time-based trends
- Created reports and dashboards to visualize attack activity
- Configured scheduled alerts for >5 attempts from single IP

---

## 🌐 Lab 2: Web Application Attack Detection

**Dataset:** OWASP Juice Shop traffic (via OWASP ZAP)

- Ingested HTTP traffic into custom Splunk index
- Built detections for SQL injection, directory traversal, password spraying
- Created timecharts to visualize attack patterns
- Designed dashboard with pie charts, timecharts, and summary tables
- Configured alert for password spraying (>20 failed logins in 10 min)

---

## ⚡ Skills Demonstrated

- Splunk data ingestion & index configuration
- SPL query building (`stats`, `top`, `timechart`, `rex`)
- Security detection workflows
- Dashboard building & visualization
- Alerting and automation

---

[← Back to Portfolio](../README.md)
