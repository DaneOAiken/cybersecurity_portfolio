# Capture The Flag Challenges 🚩

## 📋 Overview
This collection showcases **25+ hands-on CTF challenges** completed during Florida State University's CTF course. The challenges span multiple cybersecurity domains including cryptography, web exploitation, reverse engineering, binary exploitation, and digital forensics.

These exercises simulate real-world attack scenarios and demonstrate practical skills in offensive security, vulnerability analysis, and incident response.

---

## 🔗 Quick Navigation

| [🔐 Cryptography](#-cryptography) | [🌐 Web Exploitation](#-web-exploitation) | [🔧 Reverse Engineering](#-reverse-engineering) |
|:---:|:---:|:---:|
| [💥 Binary Exploitation](#-binary-exploitation) | [🔍 Digital Forensics](#-digital-forensics) | [🏆 Final CTF](#-final-ctf-competition) |

---

## 📊 Challenge Statistics

<div align="center">

| Category | Challenges Solved | Key Tools |
|:---------|:-----------------:|:----------|
| 🔐 Cryptography | 3 | CyberChef, Python |
| 🌐 Web Exploitation | 6 | Burp Suite, DevTools |
| 🔧 Reverse Engineering | 9 | Ghidra, GDB, pwndbg |
| 💥 Binary Exploitation | 3 | pwntools, pwndbg |
| 🔍 Digital Forensics | 6 | Wireshark, Volatility, StegSolve |
| 🏆 Final Competition | 12 | Multi-domain |
| **Total** | **25+** | |

</div>

---

## 🔐 Cryptography

### [Cryptography Fundamentals](./Cryptography/Cryptography_Fundamentals.md)

Encoding analysis, cipher identification, and decryption techniques.

| Challenge | Technique | Difficulty |
|:----------|:----------|:----------:|
| Baby Crypto | CyberChef Magic + ROT13 | ⭐⭐ |
| Dome | Python Decryption Script | ⭐⭐⭐ |
| Infinity | Recursive Base64 Decoding | ⭐⭐ |

**Skills:** CyberChef, Base64, ROT13, Python scripting, Algorithm reversal

---

## 🌐 Web Exploitation

### [Web Security Fundamentals](./Web_Exploitation/Web_Security_Fundamentals.md)

SQL injection, authentication bypass, client-side security, and multi-vector attacks.

| Challenge | Vulnerability | Difficulty |
|:----------|:--------------|:----------:|
| Celebrity Fan Page | Multi-vector (6 parts) | ⭐⭐⭐⭐ |
| Secure Login 2 | SQL Injection | ⭐⭐⭐ |
| Adlib Quest | Source Code Analysis | ⭐⭐ |

**Skills:** SQL Injection, JWT Analysis, Path Traversal, Client-side Analysis, Browser DevTools

---

## 🔧 Reverse Engineering

### [Binary Reversing Fundamentals](./Reverse_Engineering/Binary_Reversing_Fundamentals.md)

Java decompilation, anti-debugging bypass, and memory inspection.

| Challenge | Technique | Difficulty |
|:----------|:----------|:----------:|
| Droids | JAR Decompilation + Decryption | ⭐⭐⭐ |
| Four Nations | Anti-Debug Bypass + Memory Analysis | ⭐⭐⭐⭐ |
| Old Skool | Memory Inspection + Input Validation | ⭐⭐⭐ |

### [Advanced Reverse Engineering](./Reverse_Engineering/Advanced_Reverse_Engineering.md)

Ghidra analysis, XOR encryption, and PRNG exploitation.

| Challenge | Technique | Difficulty |
|:----------|:----------|:----------:|
| Indiana Jones Temple | Ghidra + XOR Decryption | ⭐⭐⭐⭐ |
| Robbery | Encryption Algorithm Reversal | ⭐⭐⭐ |
| Secret Seed | PRNG Seed Bruteforce | ⭐⭐⭐⭐ |

**Skills:** Ghidra, GDB/pwndbg, JD-GUI, Anti-debugging Bypass, XOR Cryptanalysis, PRNG Analysis

---

## 💥 Binary Exploitation

### [Binary Exploitation Fundamentals](./Binary_Exploitation/Binary_Exploitation_Fundamentals.md)

Buffer overflows, return address overwrites, and ret2libc attacks.

| Challenge | Vulnerability | Difficulty |
|:----------|:--------------|:----------:|
| Nums | Buffer Overflow (Variable Overwrite) | ⭐⭐⭐ |
| Guess | Return Address Overwrite | ⭐⭐⭐⭐ |
| Gas | ret2libc / ROP Chain | ⭐⭐⭐⭐⭐ |

**Skills:** pwntools, Buffer Overflow, ROP Chains, ASLR Bypass, libc Exploitation

---

## 🔍 Digital Forensics

### [Network Forensics](./Forensics/Network_Forensics.md)

PCAP analysis, data exfiltration detection, and memory forensics.

| Challenge | Technique | Difficulty |
|:----------|:----------|:----------:|
| bad_word | PCAP + JSFuck Decoding | ⭐⭐⭐ |
| stolen_artifact | Base64 Data Exfiltration | ⭐⭐⭐⭐ |
| notetaker | Memory Forensics + Hash Cracking | ⭐⭐⭐⭐ |

### [Steganography & Disk Forensics](./Forensics/Steganography_Disk_Forensics.md)

Bit plane analysis, file carving, and hidden data extraction.

| Challenge | Technique | Difficulty |
|:----------|:----------|:----------:|
| Palette | StegSolve Bit Plane Analysis | ⭐⭐⭐ |
| Turkey | Steghide + Hash Cracking | ⭐⭐⭐⭐ |
| Security Breach | Disk Forensics (foremost) | ⭐⭐⭐⭐ |

**Skills:** Wireshark, Volatility, StegSolve, steghide, foremost, binwalk, CyberChef

---

## 🏆 Final CTF Competition

### [Final CTF Writeups](./Final_CTF/Final_CTF_Competition.md)

12 multi-domain challenges from FSU's Final CTF Competition.

| Challenge | Category | Difficulty |
|:----------|:---------|:----------:|
| Holy Grail | Reverse Engineering | ⭐⭐⭐⭐ |
| Chamber of Secrets | Reverse Engineering | ⭐⭐⭐⭐ |
| Dragons | Binary Analysis | ⭐⭐⭐⭐ |
| 1337 C0nv3r73r | Web (SSTI) | ⭐⭐⭐ |
| Pokemon | Web (Command Injection) | ⭐⭐ |
| Seminole Lounge | Web (XXE) | ⭐⭐⭐ |
| Rabbit Hole | Multi-Layer Forensics | ⭐⭐⭐⭐⭐ |
| Master Key | Binary Exploitation | ⭐⭐⭐⭐ |
| Rails on Ruby | Cryptography | ⭐⭐ |
| A Rat | RSA Cryptography | ⭐⭐⭐ |
| PILlow | Steganography | ⭐⭐⭐⭐ |

**Result:** 12/12 challenges solved (100%)

---

## 🛠 Tools & Technologies

### Analysis Tools

| Tool | Purpose | Experience |
|:-----|:--------|:----------:|
| **Ghidra** | Reverse engineering | ⭐⭐⭐⭐⭐ |
| **GDB / pwndbg** | Binary debugging | ⭐⭐⭐⭐⭐ |
| **Wireshark** | Network analysis | ⭐⭐⭐⭐⭐ |
| **Volatility** | Memory forensics | ⭐⭐⭐⭐ |
| **Burp Suite** | Web security testing | ⭐⭐⭐⭐ |
| **CyberChef** | Data transformation | ⭐⭐⭐⭐⭐ |
| **StegSolve** | Image steganography | ⭐⭐⭐⭐ |
| **pwntools** | Exploit development | ⭐⭐⭐⭐⭐ |

### Programming & Scripting

| Language | Use Case |
|:---------|:---------|
| **Python** | Automation, exploitation, data processing |
| **Bash** | System navigation, tool scripting |
| **SQL** | Database queries, injection testing |

---

## 📈 Skills Development

### Offensive Security
- ✅ Web application vulnerability exploitation
- ✅ SQL injection and authentication bypass
- ✅ Binary reverse engineering and debugging
- ✅ Buffer overflow and ROP chain attacks
- ✅ Cryptographic analysis and decryption

### Defensive Security
- ✅ Network traffic analysis and anomaly detection
- ✅ Memory forensics and malware analysis
- ✅ Incident response and artifact collection
- ✅ Understanding attacker methodologies (TTPs)

---

## 🎯 Career Relevance

These CTF challenges directly map to cybersecurity roles:

| Role | Relevant Skills |
|:-----|:----------------|
| **Penetration Tester** | Web exploitation, binary analysis |
| **SOC Analyst** | Forensics, incident response, log analysis |
| **Malware Analyst** | Reverse engineering, memory forensics |
| **Security Researcher** | Vulnerability discovery, exploit development |

---

## 🔗 Related Portfolio Sections

- **[Splunk Home Labs](../Splunk_HomeLabs/)** - SIEM analysis and threat detection
- **[TryHackMe SOC Analyst](../TryHackMe_SOCAnalyst1/)** - Blue team operations
- **[Certifications](../_Certifications/)** - Security+, CySA+, Google Cybersecurity, SAL1

---

## 🏅 Certifications & Credentials

<div align="center">

![CompTIA Security+](https://img.shields.io/badge/CompTIA-Security%2B-C8202F?style=flat-square&logo=comptia&logoColor=white)
![CompTIA CySA+](https://img.shields.io/badge/CompTIA-CySA%2B-C8202F?style=flat-square&logo=comptia&logoColor=white)
![Google Cybersecurity](https://img.shields.io/badge/Google-Cybersecurity-4285F4?style=flat-square&logo=google&logoColor=white)
![TryHackMe SAL1](https://img.shields.io/badge/TryHackMe-SOC_Analyst_1-212C42?style=flat-square&logo=tryhackme&logoColor=white)

</div>

---

*"In cybersecurity, the learning never stops. Every challenge is an opportunity to understand both how attackers think and how defenders must respond."*

---

**Last Updated:** February 2025
