# thanks
[Simple Fivem Show Player ID Command Script](https://github.com/berkayediz/ee-ids-master)

EE-IDs is a script for FiveM that allows you to display player IDs above their characters. When the `/ids` command is executed, it shows the player IDs for a duration of 5 seconds within a 100-unit range, and then automatically hides them.

## Features

- Toggle the visibility of player IDs with the `/ids` command.
- Player IDs are displayed above characters within a customizable distance.
- Only show Player who is new to your server.

## Installation

1. Download the `unky_showid` script.
2. Rename the folder to `unky_showid` (if not already named).
3. Place the unky_showid` folder in your FiveM server's resource directory.
4. excute this sql `ALTER TABLE players ADD COLUMN online_time INT NOT NULL DEFAULT 0`
5. Add `ensure unky_showid` to your `server.cfg` file.

## Usage

1. automatic show up when u get in game
2. automatic disapper when u r not a noob to the server

## Customization

You can customize the maximum distance for displaying player IDs by modifying the value in the `Config.Distance`
