#!/bin/bash
echo "[*] Passive Recon: Gathering WHOIS and DNS info"
domain=$1
whois $domain > passive_whois.txt
dig $domain any >> passive_dns.txt
echo "[+] Done! Output saved to passive_whois.txt & passive_dns.txt"
