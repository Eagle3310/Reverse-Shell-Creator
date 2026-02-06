# Reverse-Shell-Generator
🔁 Reverse Shell Creator

A lightweight Bash tool that automates reverse shell payload generation using your local IP address and a random port. Built for CTFs, labs, and authorized penetration testing.

---
✨ Features

Auto-detects local IPv4 address

Random port generation (3000–6000)

Reverse shells for PHP, Bash, Python

URL-encoded payloads (Burp-friendly)

Interactive menu

Fast and minimal

---
⚠️ Disclaimer

For educational use only.
Do not use against systems you don’t own or have permission to test.

---
🛠 Requirements

Linux

Bash

ip (iproute2)

burp_urlencode function in ~/.bash_functions

---
📦 Installation

Clone the repository and make the script executable:
```bash
git clone https://github.com/Eagle3310/reverse-shell-generator.git
cd reverse-shell-generator
chmod +x reverse_shell.sh
```
Add Burp URL Encoder Helper

This tool relies on a burp_urlencode helper function.
Add the following to your ~/.bash_functions file:
```bash
burp_urlencode() {
  local LC_ALL=C
  for (( i=0; i<${#1}; i++ )); do
    c="${1:i:1}"
    case "$c" in
      [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
      *) printf '%%%02X' "'$c" ;;
    esac
  done
}
```
Reload your shell:
```bash
source ~/.bash_functions
```
---

🚀 Usage
```bash
./reverse_shell.sh
```
Script detects IP & generates a port

Select payload type

Copy generated shell

Start listener:
```bash
nc -lvnp <PORT>
```

Execute payload on target

---
