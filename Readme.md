# ![](https://github.com/docker-suite/artwork/raw/master/logo/png/logo_32.png) ubuntu-cppmf
<!-- [![Build Status](http://jenkins.hexocube.fr/job/docker-suite/job/caddy/badge/icon?color=green&style=flat-square)](http://jenkins.hexocube.fr/job/docker-suite/job/caddy/)
![Docker Pulls](https://img.shields.io/docker/pulls/dsuite/caddy.svg?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/dsuite/caddy.svg?style=flat-square)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/dsuite/caddy/latest.svg?style=flat-square)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/dsuite/caddy/latest.svg?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat-square)](https://opensource.org/licenses/MIT) -->

This image provides lots of pre-installed softwares will working on C++ / Go / Node / ... project.  
Thus, and this is an exception, this image is not built on top of [Alpine][alpine] but on top of [Debian Buster][debian buster].


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) Installed packages
[ccache](ccache) / [cmake](clang) / [doxygen](doxygen) / [GNU gcc](gcc) / [LLVM / Clang](clang) / [git](git) / [Go](goland) / [ninja](ninja) / [Node.js](nodejs) with [nvm](nvm) / [perl](perl) / [Python3](python) and some extensions / [ruby](ruby) / [Sphinx](sphinx)

For a full list of installed softwares, check ion Makefile.

## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) WARNING

Considering all the installed packages, this image is very large


[alpine]: http://alpinelinux.org/
[debian buster]: https://www.debian.org/releases/buster/

[ccache]: https://ccache.dev/
[cmake]: https://cmake.org/
[clang]: https://clang.llvm.org/docs/UsersManual.html
[doxygen]: https://www.doxygen.nl/index.html
[gcc]: https://gcc.gnu.org/
[git]: https://git-scm.com/
[goland]: https://golang.org/ 
[ninja]: https://ninja-build.org/
[nodejs]: https://nodejs.org/en/
[nvm]: https://github.com/nvm-sh/nvm
[perl]: https://www.perl.org/
[python]: https://www.python.org/
[ruby]: https://www.ruby-lang.org/
[sphinx]: https://www.sphinx-doc.org/
