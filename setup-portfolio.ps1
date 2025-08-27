# Create the root portfolio folder
New-Item -Path . -Name "cybersecurity-portfolio" -ItemType Directory


# Navigate into it
Set-Location "cybersecurity-portfolio"


# Create top-level Markdown files
New-Item -Name "README.md" -ItemType File
New-Item -Name "Network_Forensics.md" -ItemType File
New-Item -Name "Cryptography.md" -ItemType File
New-Item -Name "WebSecurity.md" -ItemType File
New-Item -Name "Malware_Analysis.md" -ItemType File
New-Item -Name "Digital_Forensics.md" -ItemType File
New-Item -Name "Password_Cracking.md" -ItemType File
New-Item -Name "Network_Protocol_Analysis.md" -ItemType File
New-Item -Name "Binary_Exploitation.md" -ItemType File


# Create assets/images subfolder
New-Item -Path . -Name "assets" -ItemType Directory
New-Item -Path "assets" -Name "images" -ItemType Directory