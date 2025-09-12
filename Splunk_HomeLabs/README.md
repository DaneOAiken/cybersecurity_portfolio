# Splunk Home Labs 🖥️

## 📂 Overview

This folder contains hands-on Splunk labs designed to build SIEM and detection engineering skills. Each walkthrough mirrors real-world analyst workflows: ingesting logs, running searches, visualizing results, and creating automated alerts.

---

## 🔒 Completed Walkthroughs

### 1. [SSH\_Brute\_Force\_Detection.md](SSH_Brute_Force_Detection.md)

* **Dataset:** Kaggle SSH Brute Force JSON logs
* **Focus:** Detect brute force attempts by attacker IP and targeted usernames
* **Highlights:**

  * Parsed JSON into fields (`foreign_ip`, `username`, `timestamp`)
  * Built searches for IP counts, username counts, and time-based trends
  * Created reports and dashboards to visualize attack activity
  * Configured a scheduled weekly alert to notify on >5 attempts from a single IP

### 2. [Detecting_Web_Application_Attacks_in_OWASP_Juice_Shop_Logs.md](Detecting_Web_Application_Attacks_in_OWASP_Juice_Shop_Logs.md)

* **Dataset:** OWASP Juice Shop traffic (captured via OWASP ZAP, exported as CSV)
* **Focus:** Detect common web application attacks (SQLi, password spraying, directory traversal, command injection)
* **Highlights:**

  * Ingested ZAP-exported HTTP traffic into a custom Splunk index (`juice`)
  * Verified fields and decoded URL payloads for analysis
  * Built detections for SQL injection, traversal, password spraying, and command injection
  * Created timecharts to visualize attack spikes
  * Summarized top payloads, endpoints, and sources in reports
  * Designed a dashboard combining pie charts, timecharts, and summary tables
  * Configured a scheduled alert to detect password spraying (>20 failed logins in 10 minutes)

---

## 📜 Upcoming Walkthroughs

* **Walkthrough 3:** IDS/Firewall Alerts (Snort/Suricata)

---

## ⚡ Skills Highlighted

* Splunk data ingestion & index configuration
* SPL query building (`stats`, `top`, `timechart`)
* Security detection workflows (brute force, web app attacks, IDS alerts)
* Dashboard building & visualization
* Alerting and automation in Splunk

---

## 📫 Contact

* **Email:** [daneoaiken@gmail.com](mailto:daneoaiken@gmail.com)
* **LinkedIn:** [linkedin.com/in/dane-aiken](https://www.linkedin.com/in/dane-aiken/)

---
