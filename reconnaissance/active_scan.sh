#!/bin/bash
echo "[*] Active Recon using Nmap..."
ip=$1
nmap -sS -sV -O -A $ip -oN active_nmap_scan.txt
echo "[+] Nmap Scan Complete. Saved to active_nmap_scan.txt"
