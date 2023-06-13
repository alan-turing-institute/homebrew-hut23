# homebrew-hut23

Homebrew tap for Hut23 internal use

This is a [Homebrew](https://brew.sh) tap for applications and utilities developed by the Research
Engineering Group for their own use.

Usage:

    brew tap alan-turing-institute/hut23

## For developers

    brew install --build-bottle --verbose whatwhat
    brew bottle whatwhat
    
Then edit the filename so there is a single dash after the project
name, not two. Then:

    gh release upload <tag> <bottle.tar.gz>
    
from the whatwhat repo.
