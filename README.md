<!--
SPDX-FileCopyrightText: 2024 Simon Dalvai <info@simondalvai.org>

SPDX-License-Identifier: CC0-1.0
-->

# Pocket Broomball
[![Android upload](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-android.yml/badge.svg)](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-android.yml)
[![iOS upload](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-ios.yml/badge.svg)](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-ios.yml)
[![itch.io upload](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-itchio.yml/badge.svg)](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-itchio.yml)
[![Linux upload](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-linux.yml/badge.svg)](https://github.com/dulvui/pocket-broomball/actions/workflows/upload-linux.yml)

The world's first Broomball video game made with Godot Engine.
This game is **Free and Open Source**, with **no ads** and **no tracking**.  
This source code is available on [Github](https://github.com/dulvui/pocket-broomball) and [Codeberg](https://codeberg.org/dulvui/pocket-broomball)

<a href="https://play.google.com/store/apps/details?id=com.salvai.broomball" target="_blank"><img src="store-images/PlayStore.svg" alt="Get it on Google Play" height="49"></a>
<a href="https://apps.apple.com/app/pocket-broomball/id1511009171" target="_blank"><img src="store-images/AppStore.svg" alt="Download on the App Store" height="50" ></a>
<a href="https://f-droid.org/en/packages/com.simondalvai.pocketbroomball/" target="_blank"><img src="store-images/get-it-on-en.webp" alt="Get it on F-Droid" height="50px" ></a>
<a href="https://github.com/dulvui/pocket-broomball/releases/" target="_blank"><img src="store-images/Github.webp" alt="Get it on Github" height="50px" ></a>
<a href="https://flathub.org/apps/org.simondalvai.pocket-broomball" target="_blank"><img src="store-images/flathub.webp" alt="Get it on Flathub" height="50px" ></a>
<a href="https://simondalvai.itch.io/pocket-broomball" target="_blank"><img src="store-images/itchio.webp" alt="Available on itch.io" height="50px" ></a>

<div>
  <img src="metadata/en-US/images/phoneScreenshots/screenshot-1.png" alt="Level 1" width="200"/>
  <img src="metadata/en-US/images/phoneScreenshots/screenshot-2.png" alt="Level 2" width="200"/>
  <img src="metadata/en-US/images/phoneScreenshots/screenshot-3.png" alt="Level 3" width="200"/>
  <img src="metadata/en-US/images/phoneScreenshots/screenshot-4.png" alt="Level 4" width="200"/>
</div>

## Table of contents
- [Pocket Broomball](#pocket-broomball)
  - [Table of contents](#table-of-contents)
  - [Roadmap](#roadmap)
  - [Setup](#setup)
    - [export\_presets.cfg](#export_presetscfg)
  - [Join with your Broomball team](#join-with-your-broomball-team)
  - [Translations](#translations)
  - [Contributions](#contributions)
  - [Licenses and Copyrights](#licenses-and-copyrights)
  - [Licenses](#licenses)
  - [Third party assets](#third-party-assets)
    - [Audio](#audio)
    - [2D assets](#2d-assets)
    - [Fonts](#fonts)

## Roadmap
Features/issues lists are visible in the [Roadmap](ROADMAP.md) 

## Setup
Get the version of the Godot Engine 3.x editor and check out the repo.
Then open the `game/project.godot` file with the editor.

For further instructions, like exporting to mobile, please read the official [Godot Docs](https://docs.godotengine.org/en/stable/).

### export_presets.cfg

To be able to export for Android or iOS, copy the `export_presets.exmaple` file and fill in your values.
```sh
cp game/export_presets.[platform].example game/export_presets.cfg
```

## Join with your Broomball team
If you want to see your broomball team or even the whole league in the game, just contact me at info@simondalvai.org  
Or make a pull request with the team's logos, names and stats (speed, power) and I'll publish them!

## Translations
If you found typos or want to add a language to the game, please open a pull request.

All words in the game with all it's languages are located in this file  
`game/translations/translations.csv`

The store descriptions are located here  
`store-pages/`

## Contributions
If you want to contribute to the project, please fork the repo, make your changes and make a pull request with a short description of the changes you made.

To be sure that your changes will be merged, you can open an issue first with the details of the changes.
Then we will see together, if and how the change could be implemented.

## Licenses and Copyrights
The game itself is licensed under the GNU AGPL v3.0 or later license and all assets made by myself are licensed under the CC-BY-SA-4.0 license.  
All third parties assets and code have different licenses and copyrights holders.

This project uses the [FSFE reuse tool](https://github.com/fsfe/reuse-tool) to license files.  
Check out all licenses and copyrights holders [here](.RESUE.toml).  
The corresponding full license texts can be found in the LICENSES/ directory.

## Licenses
The game itself is licensed under the [GNU AGPL v3.0](LICENSE) license and all  
assets made by myself are licensed under the [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/) license.

## Third party assets

### Audio

Files: game/assets/sounds/chill-music.ogg  
Copyright: 2016 furbyguy https://freesound.org/people/furbyguy/sounds/365187/  
License: CC0-1.0

Files: game/assets/sounds/music.ogg  
Copyright: 2017 furbyguy https://freesound.org/people/furbyguy/sounds/388101/  
License: CC0-1.0

Files: game/assets/sounds/croud.ogg  
Copyright: 2017 giddster https://freesound.org/people/giddster/sounds/406214/  
License: CC0-1.0

Files: game/assets/sounds/horn.ogg  
Copyright: 2012 santino_c https://freesound.org/people/santino_c/sounds/170825/  
License: CC0-1.0

Files: game/assets/sounds/hit.ogg  
Copyright: 2012 volivieri https://freesound.org/people/volivieri/sounds/37155/  
License: CC-BY-3.0

### 2D assets

"Simple icons" by simple-icons (https://github.com/simple-icons/simple-icons) are licensed under [CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/)
```
game/assets/link-buttons/codeberg.svg
game/assets/link-buttons/mastodon.svg
game/assets/link-buttons/github.svg
```

**The team logos** where send to me by themselves.  
Since they haven't issued a license for the logos, no license is available and
all rights belong to the corresponding team.  
If you want to use them, please contact me at info@simondalvai.org or the  
teams directly.

### Fonts
"Carlito Regular"  
Copyright: 2022 Łukasz Dziedzic https://www.1001fonts.com/carlito-font.html  
License: OFL-1.1

"DSEG7ClassicMini Bold"  
Copyright: 2022 Keshikan https://github.com/keshikan/DSEG  
License: OFL-1.1
