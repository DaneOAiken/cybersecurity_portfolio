# Final CTF Competition Writeups

[← Back to CTF Challenges](README.md) · [← Back to Portfolio](../README.md)

---

## 🔎 Overview
This collection documents challenges from FSU's Final CTF Competition, showcasing diverse cybersecurity skills across multiple domains.

**Source:** FSU CTF Course - Final Competition  
**Challenges Solved:** 12/12  
**Difficulty:** Mixed (Easy to Expert)

---

## 📊 Challenge Summary

| Challenge | Category | Flag | Difficulty |
|:----------|:---------|:-----|:----------:|
| Holy Grail | Reverse Engineering | `fsuCTF{kn19h75_wh0_s4y_n1}` | ⭐⭐⭐⭐ |
| The GOAT Part 2 | Cryptography | `fsuCTF{7h3_573p5_4r3_4n_4c7u41_r3c1p3...}` | ⭐⭐⭐ |
| Chamber of Secrets | Reverse Engineering | `fsuCTF{sssssSSSsssSss...}` | ⭐⭐⭐⭐ |
| Dragons | Binary Analysis | `fsuCTF{t1m3_t0_p1ck_y0ur_dr4g0n}` | ⭐⭐⭐⭐ |
| 1337 C0nv3r73r | Web (SSTI) | `fsuC7F{1s_n0d3_b3773r_7h4n_php}` | ⭐⭐⭐ |
| Pokemon | Web (Command Injection) | `fsuCTF{pr0f3550r_04k_1_d0n7_f33l_50_600d}` | ⭐⭐ |
| Seminole Lounge | Web (XXE) | `fsuCTF{600d_v1b35}` | ⭐⭐⭐ |
| Rabbit Hole | Multi-Layer Forensics | `fsuCTF{f4lling_d0wn_ju$t_lik3_Al!ce}` | ⭐⭐⭐⭐⭐ |
| Master Key | Binary Exploitation | `fsuCTF{why_15_17_c4ll3d_4_5k3l370n_k3y}` | ⭐⭐⭐⭐ |
| Rails on Ruby | Cryptography | `fsuCTF{5ubw4y_5urf3r5_4773n710n_5p4n}` | ⭐⭐ |
| A Rat | RSA Cryptography | `fsuCTF{w34k357_l1nk_50m37h1n6}` | ⭐⭐⭐ |
| PILlow | Steganography | `fsuCTF{st3g_s0lv3_only_g3ts_y0u_s0_f4r}` | ⭐⭐⭐⭐ |

---

## 🔧 Reverse Engineering

### Challenge: Holy Grail
**Flag:** `fsuCTF{kn19h75_wh0_s4y_n1}`

<img src="assets/images/Final_CTF/fctf_holygrail_ghidra.png" alt="Holy Grail Ghidra" width="650">

*Ghidra analysis revealing encrypted answers and decryption logic*

---

### Challenge: The GOAT Part 2
**Flag:** `fsuCTF{7h3_573p5_4r3_4n_4c7u41_r3c1p3_50_y0ur3_w31c0m3}`

<img src="assets/images/Final_CTF/fctf_goat_decrypt.png" alt="GOAT Decrypt" width="600">

*Decryption script reversing the encryption algorithm*

---

### Challenge: Chamber of Secrets
**Flag:** `fsuCTF{sssssSSSsssSssssSSsssSSSsSSSSSsssSSsSsSsSsSSsSSsSSSSSS}`

<img src="assets/images/Final_CTF/fctf_chamber_analysis.png" alt="Chamber Analysis" width="650">

*Function analysis revealing the uppercase/lowercase S pattern*

---

### Challenge: Dragons
**Flag:** `fsuCTF{t1m3_t0_p1ck_y0ur_dr4g0n}`

<img src="assets/images/Final_CTF/fctf_dragons_pwndbg.png" alt="Dragons pwndbg" width="650">

*pwndbg showing code segments extracted from memory*

---

## 🌐 Web Exploitation

### Challenge: 1337 C0nv3r73r (SSTI)
**Flag:** `fsuC7F{1s_n0d3_b3773r_7h4n_php}`

<img src="assets/images/Final_CTF/fctf_1337_ssti.png" alt="SSTI Exploit" width="650">

*SSTI payload reading flag.txt*

---

### Challenge: Pokemon (Command Injection)
**Flag:** `fsuCTF{pr0f3550r_04k_1_d0n7_f33l_50_600d}`

<img src="assets/images/Final_CTF/fctf_pokemon_cmdinj.png" alt="Command Injection" width="650">

*Command injection payload revealing the flag*

---

### Challenge: Seminole Lounge (XXE)
**Flag:** `fsuCTF{600d_v1b35}`

<img src="assets/images/Final_CTF/fctf_seminole_xxe.png" alt="XXE Exploit" width="600">

*XXE payload reading flag.txt through external entity*

---

## 🔍 Digital Forensics

### Challenge: Rabbit Hole (Multi-Layer)
**Flag:** `fsuCTF{f4lling_d0wn_ju$t_lik3_Al!ce}`

#### Part 1: Metadata Analysis

<img src="assets/images/Final_CTF/fctf_rabbithole_exif.png" alt="EXIF Analysis" width="600">

*ExifTool revealing flag segment in Artist field*

#### Part 2: Binwalk Extraction

<img src="assets/images/Final_CTF/fctf_rabbithole_binwalk.png" alt="Binwalk Extraction" width="600">

*Binwalk extracting embedded files from the image*

#### Part 3: Steghide

<img src="assets/images/Final_CTF/fctf_rabbithole_steghide.png" alt="Steghide Extraction" width="600">

*Steghide extracting PDF containing final flag segment*

---

### Challenge: PILlow (LSB Steganography)
**Flag:** `fsuCTF{st3g_s0lv3_only_g3ts_y0u_s0_f4r}`

#### StegSolve Analysis

<img src="assets/images/Final_CTF/fctf_pillow_stegsolve.png" alt="PILlow StegSolve" width="600">

*StegSolve showing LSB data in green channel*

#### Python Extraction Script

<img src="assets/images/Final_CTF/fctf_pillow_script.png" alt="PILlow Script" width="650">

*Python script extracting binary data from green channel LSB*

---

## 🔐 Cryptography

### Challenge: Rails on Ruby (Rail Fence)
**Flag:** `fsuCTF{5ubw4y_5urf3r5_4773n710n_5p4n}`

<img src="assets/images/Final_CTF/fctf_railfence_decode.png" alt="Rail Fence Decode" width="600">

*Online tool decoding the Rail Fence cipher*

---

### Challenge: A Rat (RSA)
**Flag:** `fsuCTF{w34k357_l1nk_50m37h1n6}`

<img src="assets/images/Final_CTF/fctf_rsa_factordb.png" alt="FactorDB" width="600">

*FactorDB successfully factoring the weak RSA modulus*

<img src="assets/images/Final_CTF/fctf_rsa_script.png" alt="RSA Script" width="600">

*Python script computing private key and decrypting flag*

---

## 💥 Binary Exploitation

### Challenge: Master Key
**Flag:** `fsuCTF{why_15_17_c4ll3d_4_5k3l370n_k3y}`

<img src="assets/images/Final_CTF/fctf_masterkey_cyclic.png" alt="Master Key Cyclic" width="600">

*Finding offset with cyclic pattern and constructing exploit*

---

## 📊 Competition Results

| Category | Challenges | Score |
|:---------|:----------:|:-----:|
| Reverse Engineering | 4 | ✅ |
| Web Exploitation | 3 | ✅ |
| Cryptography | 3 | ✅ |
| Digital Forensics | 2 | ✅ |
| Binary Exploitation | 1 | ✅ |
| **Total** | **12/12** | **100%** |

---

*Final CTF Competition - FSU CTF Course - Spring 2025*

---

[← Back to CTF Challenges](README.md) · [← Back to Portfolio](../README.md)
