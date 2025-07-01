from datetime import datetime

target = input("Target: ")
date = datetime.now().strftime("%Y-%m-%d")
with open("reporting/report_template.md", "r") as f:
    content = f.read()

content = content.replace("{{target}}", target)
content = content.replace("{{date}}", date)
content = content.replace("{{example}}", "MS17-010 SMB RCE")
content = content.replace("{{vuln}}", "MS17-010")

with open("Pentest_Report.md", "w") as f:
    f.write(content)

print("[+] Report Generated: Pentest_Report.md")
