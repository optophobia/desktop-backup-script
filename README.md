# Desktop Backup Script

A simple Windows batch script that backs up the contents of your Desktop to a USB thumb drive with a single double-click.

---

## What It Does

- Automatically detects your plugged-in USB drive
- Creates a dated backup folder on the USB (e.g. `Backup-2026-04-10`)
- Copies all files and subfolders from your Desktop into that folder
- Each backup run creates a new dated folder, so previous backups are preserved
- Skips shortcuts (`.lnk`), batch files (`.bat`), and Windows system files (`desktop.ini`)

---

## Requirements

- Windows 10 or Windows 11
- PowerShell (built into Windows — no installation needed)
- A USB thumb drive

---

## How to Use

1. Download `CreateBackup.bat` and save it to your Desktop
2. Plug in your USB thumb drive
3. Double-click `CreateBackup.bat`
4. Wait for the confirmation message
5. Eject your USB drive when ready

That's it! Your files will be backed up to a folder named `Backup-YYYY-MM-DD` on your USB drive.

---

## Optional: Create a Desktop Shortcut with a Custom Icon

For a more polished experience you can create a shortcut with a custom icon:

1. Right-click `CreateBackup.bat` → **Send to → Desktop (create shortcut)**
2. Right-click the new shortcut → **Properties**
3. Click **Change Icon...**
4. Browse to `C:\Windows\System32\imageres.dll` and choose an icon you like
5. Rename the shortcut to **Create Backup**

---

## What Gets Backed Up

| Included | Excluded |
|----------|----------|
| Word documents, PDFs, images | Shortcuts (`.lnk`) |
| Subfolders and their contents | Batch files (`.bat`) |
| Spreadsheets, text files, etc. | `desktop.ini` system files |

---

## Example Output

After running the script, your USB drive will look like this:

```
D:\
└── Backup-2026-04-10\
    ├── My Document.docx
    ├── Budget.xlsx
    ├── Project Notes.txt
    └── Photos\
        ├── photo1.jpg
        └── photo2.jpg
```

Each time you run the script a new dated folder is created, so you build up a history of backups over time.

---

## Version History

| Version | Date | Notes |
|---------|------|-------|
| v1.0 | April 2026 | Initial release |

---

## License

Free to use and modify for personal use.
