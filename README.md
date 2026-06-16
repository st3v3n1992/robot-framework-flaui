# Robot Framework + FlaUILibrary
Handleiding Windows Native Desktop Automation met Robot Framework

🚀 Robot Framework FlaUILibrary Setup Guide

⚠ Deze handleiding is alleen bedoeld voor Windows.

---

# 🧠 Wat is FlaUILibrary?

FlaUILibrary is een Robot Framework library voor:

- Windows desktop automation
- Win32 automation
- WinForms automation
- WPF automation

FlaUI gebruikt intern:

- Windows UI Automation (UIA)

---

# 🚀 Volledige projectstructuur

```text
robot-framework-flaui/
├── .venv/
├── tests/
│   └── desktop/
├── resources/
│   ├── keywords/
│   ├── variables/
│   └── locators/
├── test-data/
├── results/
├── requirements.txt
├── .gitignore
└── README.md
```

---

# 🚀 0. Python installeren

## Download Python

👉 https://www.python.org/downloads/windows/

⚠ BELANGRIJK tijdens installatie:

✔ Add Python to PATH aanvinken

---

## Controleer installatie

```powershell
python --version
pip --version
```

---

# 🚀 1. Repository clonen
Voer onderstaand commando uit in de map waar het project in gekloond moet worden.
```powershell
git clone https://github.com/st3v3n1992/robot-framework-flaui.git
cd robot-framework-flaui
```

---

# 🚀 2. Virtual Environment (.venv)

## Maak .venv

```powershell
python -m venv .venv
```

---

## Activeer .venv

```powershell
.\.venv\Scripts\Activate.ps1
```

---

⚠ Krijg je execution policy errors?

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Daarna opnieuw:

```powershell
.\.venv\Scripts\Activate.ps1
```

---

# 🚀 3. pip upgraden

```powershell
python -m pip install --upgrade pip
```

---

# 🚀 4. Robot Framework installeren

```powershell
pip install robotframework
```

Controle:

```powershell
robot --version
```

---

# 🚀 5. FlaUILibrary installeren

```powershell
pip install robotframework-flaui
```

---

# 🚀 6. requirements.txt

Maak bestand:

```text
requirements.txt
```

Met inhoud:

```text
robotframework
robotframework-flaui
```

Installeren:

```powershell
pip install -r requirements.txt
```

---

# 🚀 7. .gitignore

Maak bestand:

```text
.gitignore
```

Voeg toe:

```gitignore
# Python virtual environments
.venv/
venv/

# Python cache
__pycache__/
*.pyc

# Robot Framework output
results/
output.xml
log.html
report.html

# Test artifacts
screenshots/

# VS Code
.vscode/

# Windows
Thumbs.db
Desktop.ini
```
Indien er al een vooraf gegenereerde .gitignore bestaat (Python), dan hoef je alleen onderstaande nog toe te voegen
```gitignore
# Robot Framework output
results/
output.xml
log.html
report.html

# Windows
Thumbs.db
Desktop.ini

# VS Code (optioneel)
.vscode/

# Test artifacts
screenshots/
```

---

# 🚀 8. Basis projectstructuur maken

```powershell
mkdir tests
mkdir tests\desktop

mkdir resources
mkdir resources\keywords
mkdir resources\variables
mkdir resources\locators

mkdir test-data
mkdir results
```

---

# 🚀 9. VS Code extensies

Installeer:

- Python
- RobotCode - Robot Framework Support

---

# 🚀 10. Python interpreter koppelen in VS Code

1. Open projectmap
2. Open Command Palette (ctrl + Shift + P)
3. Zoek:
   `Python: Select Interpreter`
4. Kies interpreter uit `.venv`


---

# 🚀 11. Eerste desktop test

## Bestand

```text
tests/desktop/example_desktop.robot
```

## Inhoud

```robotframework
*** Settings ***
Library    FlaUILibrary

*** Test Cases ***
Open Calculator
    Launch Application    notepad.exe
```
Het kan zijn dat "Launch Application" rood onderlijnt is (stap 12 kan worden uitgevoerd en zal werken), om dit weg te halen, doe het volgende:
1. Ctrl + Shift + P
2. Developer: Reload Window

Het scherm herlaad opnieuw en de rode onderlijning is verdwenen.
---

# 🚀 12. Tests runnen

## Desktop tests

```powershell
robot -d results tests/desktop
```

---

# 🚀 13. Resultaten bekijken

```text
results/
├── log.html
├── output.xml
└── report.html
```

Open report:

```powershell
start results/log.html
```

---

# 🚀 14. Inspectietools

Voor Windows desktop automation zijn inspectietools belangrijk.

Veelgebruikte tools:

- Inspect.exe --> legacy
- Accessibility Insights --> beste om te gebruiken
- FlaUInspect --> goed, maar minder gebruiksvriendelijk

Deze helpen bij het vinden van:

- Automation IDs
- Control types
- Window structures
- UI trees

---

# 🚀 15. Handige commando's

## Python versie

```powershell
python --version
```

## pip versie

```powershell
pip --version
```

## Robot Framework versie

```powershell
robot --version
```

## Geïnstalleerde packages

```powershell
pip list
```

## Git status

```powershell
git status
```

---

# 🚀 16. Environment verlaten

```powershell
deactivate
```