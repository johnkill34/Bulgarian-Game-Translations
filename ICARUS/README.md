# ICARUS — Bulgarian Translation | johnkill34

**Project:** Bulgarian game localization and a standalone Windows mod builder/installer.

**Maintainer:** johnkill34  
**Target game build:** ICARUS 3.0.36.159996 (local installation; Steam-independent)  
**Application stack:** C# / .NET 8+ / WPF, Windows 11 x64  
**Status:** DEVELOPMENT — no game-tested PAK release yet.

## Authoritative translation
The approved text catalog is held in ChatGPT Library under
`/ICARUS - Български превод/ICARUS_ALL_STRINGS_BG_117_QA.csv`.
It has 34,374 records (34,373 non-empty original text records). This **is not yet a validated playable mod**.
Do not fabricate a copy of this CSV in the repository. An authorized transfer/upload is required before use.

## Goal
Build a self-contained Windows x64 application that detects/browses the user's local ICARUS installation, audits original game resources, generates a **real Unreal .pak** containing Bulgarian translation assets, and installs/uninstalls it without changing original game archives or requiring Steam.

## Requirements
- Visual Studio Enterprise-compatible C#/.NET/WPF solution; **no Python**, no CMD/BAT user workflow.
- Simple UI: Game Folder, Analyze, Build, Install, Verify, Uninstall, Log.
- Determine the true localization loading mechanism and mount paths from original assets and working sample mods, **before** packaging.
- Preserve all keys, source strings, placeholders, CSV encodings and JSON structure; record hash/coverage and log every change.
- Support offline standalone install and user-selectable install directory.
- Protect the game and saves: no modification of original `data.pak`; backups, collision detection, safe rollback.
- Bundle legally redistributable dependencies for a true self-contained release; if unavailable, report a blocker clearly.
- Verify PAK integrity by listing/extracting built content; use sample assets for integration tests.
- In-game verification is a separate mandatory acceptance gate; do not claim it passed without a user/game run.
- Do not modify translation wording as part of installer development.

## References
- https://github.com/Jimk72/Icarus_Software
- https://github.com/Jimk72/Icarus_Mods

The third-party `Language.ini` is only the **Mod Manager user interface** translation, not an ICARUS game localization source.

## Deliverables
1. Buildable C# WPF project + solution + automated tests.
2. Complete standalone x64 published application (portable ZIP with EXE).
3. Verified mod packaging pipeline that produces a genuine PAK, or explicit documented blocker.
4. Installation / verification / rollback workflow and concise Bulgarian instructions.

Do not publish a release called "finished" until the mod is validated on ICARUS 3.0.36.159996.
