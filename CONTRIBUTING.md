# Contributing to Ride & Dash: Airbikes

## Links
Github: https://github.com/Geegaz-Datapacks/RideDash<br>
Trello: https://trello.com/b/6W61QsGv<br>
Google sheets: [Ride & Dash: Airbikes Translations](https://docs.google.com/spreadsheets/d/18Wkkh9j2_-htaP1tnrhu6eCG12DnjkYCFCKtofINQog/edit?usp=sharing)

Modrinth: https://modrinth.com/project/ride-dash-airbikes<br>
Smithed: https://smithed.net/packs/rida

## Requirements:
- Python 3.14.x
- Beet (`pip install beet`)

**Recommended:**
- VSCode
- Python vscode extension
- Spyglass vscode extension

### About python virtual environments 
Created with `py -m venv .venv` (from the VSCode Docs: [Python - Environments](https://code.visualstudio.com/docs/python/environments#_create-a-virtual-environment-in-the-terminal)), the interpreter is selected automatically if you have the Python extension enabled. Creating a new terminal after that will activate the virtual environment, making it possible to use `pip` and `beet` commands in the terminal as usual. Just remember to run `pip install beet` after creating the virtual environment !

## Release steps
### Version Branch
1. Create a branch for the version (e.g. `v0.1.2`, `v1.1.0_beta`...) from `dev`
### Pull Request
1. Make a pull request to merge the `version` branch into `main`
2. Test the pull request
3. Update the pull request (if needed)
4. Merge the pull request
### Releases
6. Create a Github release
7. Create a Smithed version
8. Create a Modrinth version
### Cleanup
9. Merge `main` branch into `dev`

## Resources
- Cloudwolf's custom UI bars: https://www.youtube.com/watch?v=EL2X6ppZSCQ
- Cloudwolf's vehicles: https://www.youtube.com/watch?v=8cNvXMpD40A
- SolToder's UUID generator: https://www.soltoder.com/mc-uuid-converter/