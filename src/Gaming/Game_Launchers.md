---
authors:
  - "@nicknamenamenick"
  - "@termdisc"
tags:
  - Guide
---

<!-- ANCHOR: METADATA -->
<!--{"url_discourse": "https://universal-blue.discourse.group/docs?topic=2656", "fetched_at": "2024-09-03 16:43:09.533219+00:00"}-->
<!-- ANCHOR_END: METADATA -->

## **Steam Setup**

Steam can run Windows games on Linux. It utilizes a wide range of projects and patches all packed into a piece of software built-in to Steam called [Proton](https://github.com/ValveSoftware/Proton) for Windows compatibility.

### Enabling Proton For All Steam Games

!!! attention
    
    Skip this section if you're using a [_Bazzite-Deck_](../Handheld_and_HTPC_edition/Steam_Gaming_Mode.md) image.

- Currently Steam only allows whitelisted games to run by default on the desktop Steam client.
  - You can change this by enabling this in **Settings** > **Compatibility** > **Enable Steam Play for all other titles**

##### Image Example
![Steam Settings|256x267, 75%](../img/Steam_Setup_Settings.png)
![Compatibility|589x499, 75%](../img/Steam_Setup_Compatibility.png)

### Forcing A Specific Proton / Steam Play Tool Version

!!! warning 
    
    Games that use Denuvo Anti-Tamper DRM consider changing Proton versions as activiating the game on different hardware which may cause you to get locked out of the game if you change the Proton version more than 5 times within a 24 hour period.

- Games with a Linux port will be used by default on Desktop images.
- Valve selects the default runner on _Handheld/HTPC_ images.
- Some games run better with a specific version of Proton or forcing the Linux runtime.
  - Run that specific version by going into the game's **Properties** > **Compatibility** > **Force the use of a specific Steam Play compatibility tool**
##### Image Example
![Cog Icon > Properties|690x284, 75%](../img/Steam_Setup_Cog.png)
![Compatibility tab|690x492, 75%](../img/Steam_Setup_Compat_Tab.png)

## **Non-Steam Games**

- **It is recommended to use [Lutris](https://lutris.net/games?q=&ordering=-popularity&paginate_by=100) for _most_ non-steam games**.
  - However, [Heroic Games Launcher](https://heroicgameslauncher.com) is intended as a suitable replacement for the Epic Games Launcher.
  - Other games and launchers are also available in the software center (_Discover_ or _GNOME Software_) like [Itch](https://flathub.org/apps/io.itch.itch).

### Lutris Setup

#### Lutris Screenshots

![Lutris|617x500, 75%](../img/Lutris_Setup.png)

![Example of Lutris installers|623x500, 75%](../img/Lutris_Setup_Installers.png)

Lutris is game management software that doubles as a WINE front-end for Windows games. Several games and launchers can be installed by searching for the title and using one of the installer scripts for it.

#### Manually adding a Windows game to Lutris

However if your game is not listed or doesn't work with the provided script, then manually add the executable. Add locally installed game and make sure to configure it properly within the game and runner options.  It will need a [prefix directory](/Gaming/Managing_and_modding_games.md#non-steam-games-prefix-management) created or inside the default `~/.wine` directory for each game.

![Add Locally Installed Game|632x496, 75%](../img/Lutris_Setup_Add_Local_Game.png)

**Example #1**:

![Lutris manually adding games example 1|690x213](../img/Lutris_Setup_Add_Local_Game_1.png)

**Example #2**:
![Lutris manually adding games example 2|690x342, 100%](../img/Lutris_Setup_Add_Local_Game_2.png)

#### Lutris Shortcuts

![Lutris_Right_Click_Menu|421x447, 75%](../img/Lutris_Setup_Shortcut.png)

Right clicking a game on Lutris gives the option to add it as a non-Steam game (useful for Steam Gaming Mode), create a desktop shortcut, or an application menu shortcut.

### Heroic Games Launcher Setup

Heroic Games Launcher is recommended for games that were purchased from Epic Games Launcher, GOG, and Amazon Games Launcher.
![Heroic|421x447, 75%](../img/checks.png)

Make sure "**Apply known fixes automatically**" and "**Use UMU as Proton runtime**" are both checked in the settings.

### Game Pass and Microsoft Store Games (Xbox Cloud Gaming)

!!! note
    
    A Game Pass Ultimate subscription is required to use [Xbox Cloud Gaming](https://www.xbox.com/en-us/play) except for select games like Fornite.

Games installed from the Microsoft Store do **not** run unless you use a Xbox Cloud Gaming client like [Greenlight](https://github.com/unknownskl/greenlight). Fortnite can also be played via this method **without** a Game Pass subscription with Xbox Cloud Gaming.

## Auto-Mounting Game Drives

Read the [Auto-Mounting Secondary Drives Guide](../Advanced/Auto-Mounting_Secondary_Drives.md) for more information. It is also recommended to do your own research on drive mounting on Linux.

<hr>

[**<-- Back to Gaming Guide**](./index.md)
