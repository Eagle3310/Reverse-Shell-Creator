# Reverse-Shell-Generator
🔁 Reverse Shell Creator

A lightweight Bash tool that automates reverse shell payload generation using your local IP address and a random port. Built for CTFs, labs, and authorized penetration testing.

✨ Features

Auto-detects local IPv4 address

Random port generation (3000–6000)

Reverse shells for PHP, Bash, Python

URL-encoded payloads (Burp-friendly)

Interactive menu

Fast and minimal

⚠️ Disclaimer

For educational use only.
Do not use against systems you don’t own or have permission to test.

🛠 Requirements

Linux

Bash

ip (iproute2)

burp_urlencode function in ~/.bash_functions

📦 Installation
git clone https://github.com/YOUR_USERNAME/reverse-shell-generator.git
cd reverse-shell-generator
chmod +x reverse_shell.sh

🚀 Usage
./reverse_shell.sh


Script detects IP & generates a port

Select payload type

Copy generated shell

Start listener:

nc -lvnp <PORT>


Execute payload on target

🧠 Supported Shells

PHP (one-liner)

Bash

Python

📁 Structure
reverse-shell-generator/
├── reverse_shell.sh
├── README.md
└── LICENSE

🧑‍💻 Author

Madaki Meshach

⭐ Star the repo if you find it useful
