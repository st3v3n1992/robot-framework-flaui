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

# 🚀 Leerpunten / Notities

## Locators voorkeur

1. AutomationId
2. Name
3. XPath
4. Absolute XPath vermijden

## Inspectietools

1. Accessibility Insights (voorkeur)
2. FlaUInspect
3. Inspect.exe (legacy)

## Veelgebruikte FlaUI keywords

- Launch Application
- Click
- Press Keys
- Set Text To Textbox
- Get Text From Textbox
- Wait Until Element Exist

---

# 🚀 Handige commando's

Deze commando's worden regelmatig gebruikt tijdens ontwikkeling, debugging en onderhoud van het project.

⚠ De virtual environment moet actief zijn voordat onderstaande commando's worden uitgevoerd.

## Virtual Environment activeren

```powershell
.\.venv\Scripts\Activate.ps1
```

Controleer daarna of de juiste Python interpreter actief is.

```powershell
where python
```

Verwachte output:

```text
C:\Development\robot-framework-flaui\.venv\Scripts\python.exe
```

---

## Python versie controleren

Toon de geïnstalleerde Python versie.

```powershell
python --version
```

---

## pip versie controleren

Toon de geïnstalleerde pip versie.

```powershell
pip --version
```

---

## Robot Framework versie controleren

Controleer of Robot Framework correct beschikbaar is binnen de actieve virtual environment.

```powershell
robot --version
```

---

## Geïnstalleerde packages bekijken

Toon alle geïnstalleerde Python packages binnen de actieve virtual environment.

```powershell
pip list
```

---

## Alle desktop testen uitvoeren

Voer alle desktop testen uit.

```powershell
robot -d results tests/desktop
```

---

## Specifiek testbestand uitvoeren

Voer één specifiek Robot Framework bestand uit (de naam kan anders zijn in een ander robot bestand!).

```powershell
robot tests/desktop/notepad.robot
```

---

## Specifieke testcase uitvoeren

Voer één testcase uit (de naam kan anders zijn van een andere testcase in een ander (of hetzelfde) robot bestand!).

```powershell
robot -t "Open Notepad En Schrijf Tekst" tests/desktop/notepad.robot
```

---

## Robot Framework rapport openen

Open het logbestand.

```powershell
start results/log.html
```

Open het rapportbestand.

```powershell
start results/report.html
```

---

## Resultaten opschonen

Verwijder oude Robot Framework resultaten.

```powershell
Remove-Item -Recurse -Force results\*
```

Of als je een specifiek onderdeel wilt verwijderen:

```powershell
Remove-Item results\log.html
Remove-Item results\report.html
Remove-Item results\output.xml
```

---

## FlaUILibrary documentatie genereren

Genereer lokale HTML-documentatie van de geïnstalleerde versie van FlaUILibrary.

```powershell
python -m robot.libdoc FlaUILibrary flaui.html
```

Hiermee wordt een HTML-bestand gegenereerd met:

- Alle beschikbare keywords
- Beschrijvingen van keywords
- Argumenten
- Voorbeelden
- Returnwaarden (indien beschikbaar)

Open de documentatie:

```powershell
start flaui.html
```

⚠ Het bestand `flaui.html` wordt automatisch gegenereerd en hoeft niet opgeslagen te worden in Git.

Voeg daarom toe aan `.gitignore`:

```gitignore
# Generated documentation
flaui.html
```

---

## Notepad geforceerd afsluiten

Handig tijdens het oefenen met desktop automation.

```powershell
taskkill /IM notepad.exe /F /T
```

---

## Calculator geforceerd afsluiten

Handig tijdens het oefenen met desktop automation.

```powershell
taskkill /IM CalculatorApp.exe /F /T
```

---

## Actieve processen bekijken

Toon alle actieve processen.

```powershell
Get-Process
```

Zoek een specifiek proces.

```powershell
Get-Process notepad
```

---

## Git status bekijken

Toon gewijzigde bestanden.

```powershell
git status
```

---

## Wijzigingen toevoegen aan Git

Voeg alle wijzigingen toe.

```powershell
git add .
```

---

## Commit maken

Maak een commit.

```powershell
git commit -m "Beschrijving van wijziging"
```

---

## Wijzigingen pushen

Push wijzigingen naar GitHub.

```powershell
git push
```

---

## Laatste wijzigingen ophalen

Haal wijzigingen op vanuit GitHub.

```powershell
git pull
```

---

## Recente commits bekijken

Toon de laatste commits.

```powershell
git log --oneline
```

---

## requirements.txt bijwerken

Werk requirements.txt bij met alle geïnstalleerde packages.

```powershell
pip freeze > requirements.txt
```

⚠ Gebruik dit alleen wanneer bewust nieuwe dependencies zijn toegevoegd of bijgewerkt.

---

## Environment verlaten

Verlaat de actieve virtual environment.

```powershell
deactivate
```

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

# Generated documentation
flaui.html
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

# Generated documentation
flaui.html
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
start results/report.html
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

Deze commando's worden regelmatig gebruikt tijdens ontwikkeling, debugging en onderhoud van het project.

---

## Python versie controleren

Toon de geïnstalleerde Python versie.

```powershell
python --version
```

---

## pip versie controleren

Toon de geïnstalleerde pip versie.

```powershell
pip --version
```

---

## Robot Framework versie controleren

Controleer of Robot Framework correct geïnstalleerd is.

```powershell
robot --version
```

---

## Geïnstalleerde packages bekijken

Toon alle geïnstalleerde Python packages binnen de actieve virtual environment.

```powershell
pip list
```

---

## Controleren welke Python interpreter actief is

Controleer of de virtual environment actief is.

```powershell
where python
```

Verwachte output:

```text
C:\Development\robot-framework-flaui\.venv\Scripts\python.exe
```

---

## Alle desktop testen uitvoeren

Voer alle desktop testen uit.

```powershell
robot -d results tests/desktop
```

---

## Specifiek testbestand uitvoeren

Voer één specifiek Robot Framework bestand uit.

```powershell
robot tests/desktop/example_desktop.robot
```

---

## Specifieke testcase uitvoeren

Voer één testcase uit.

```powershell
robot -t "Open Notepad En Schrijf Tekst" tests/desktop/example_desktop.robot
```

---

## Robot Framework rapport openen

Open het logbestand.

```powershell
start results/log.html
```

Open het rapportbestand.

```powershell
start results/report.html
```

---

## FlaUILibrary documentatie genereren

Genereer lokale HTML-documentatie van de geïnstalleerde versie van FlaUILibrary.

```powershell
python -m robot.libdoc FlaUILibrary flaui.html
```

Hiermee wordt een HTML-bestand gegenereerd met:

- Alle beschikbare keywords
- Beschrijvingen van keywords
- Argumenten
- Voorbeelden
- Returnwaarden (indien beschikbaar)

Open de documentatie:

```powershell
start flaui.html
```

> Het bestand `flaui.html` wordt automatisch gegenereerd en hoeft niet opgeslagen te worden in Git.

Voeg daarom toe aan `.gitignore` (als deze nog niet is toegevoegd):

```gitignore
# Generated documentation
flaui.html
```

---

## Notepad geforceerd afsluiten

Handig tijdens het oefenen met desktop automation (vervang notepad.exe voor een andere taak als het om een andere applicatie gaat).

```powershell
taskkill /IM notepad.exe /F /T
```

---

## Paint geforceerd afsluiten

Handig tijdens het oefenen met desktop automation.

```powershell
taskkill /IM CalculatorApp.exe /F /T
```

---

## Actieve processen bekijken

Toon alle actieve processen.

```powershell
Get-Process
```

Zoek een specifiek proces.

```powershell
Get-Process notepad
```

---

## Git status bekijken

Toon gewijzigde bestanden.

```powershell
git status
```

---

## Wijzigingen toevoegen aan Git

Voeg alle wijzigingen toe.

```powershell
git add .
```

---

## Commit maken

Maak een commit.

```powershell
git commit -m "Beschrijving van wijziging"
```

---

## Wijzigingen pushen

Push wijzigingen naar GitHub.

```powershell
git push
```

---

## Laatste wijzigingen ophalen

Haal wijzigingen op vanuit GitHub.

```powershell
git pull
```

# 🚀 16. Environment verlaten

```powershell
deactivate
```