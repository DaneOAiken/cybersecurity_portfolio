# Splunk Home Labs 🖥️

## 📂 Overview

This folder contains hands-on Splunk labs designed to build SIEM and detection engineering skills. Each walkthrough mirrors real-world analyst workflows: ingesting logs, running searches, visualizing results, and creating automated alerts.

---

## 🔒 Completed Walkthroughs

### 1. [SSH_Brute_Force_Detection.md](SSH_Brute_Force_Detection.md)

* **Dataset:** Kaggle SSH Brute Force JSON logs
* **Focus:** Detect brute force attempts by attacker IP and targeted usernames
* **Highlights:**

  * Parsed JSON into fields (`foreign_ip`, `username`, `timestamp`)
  * Built searches for IP counts, username counts, and time-based trends
  * Created reports and dashboards to visualize attack activity
  * Configured a scheduled weekly alert to notify on >5 attempts from a single IP


---

## 📜 Upcoming Walkthroughs

* **Walkthrough 2:** Web Recon & 404 Detection (Apache Logs)
* **Walkthrough 3:** IDS/Firewall Alerts (Snort/Suricata)

---

## ⚡ Skills Highlighted

* Splunk data ingestion & index configuration
* SPL query building (`stats`, `top`, `timechart`)
* Security detection workflows (brute force, recon, IDS alerts)
* Dashboard building & visualization
* Alerting and automation in Splunk

---

## 📫 Contact

* **Email:** [daneoaiken@gmail.com](mailto:daneoaiken@gmail.com)
* **LinkedIn:** [linkedin.com/in/dane-aiken](https://www.linkedin.com/in/dane-aiken/)

---
