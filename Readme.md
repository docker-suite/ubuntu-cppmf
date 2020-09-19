# ![](https://github.com/docker-suite/artwork/raw/master/logo/png/logo_32.png) ubuntu-cppmf
<!-- [![Build Status](http://jenkins.hexocube.fr/job/docker-suite/job/caddy/badge/icon?color=green&style=flat-square)](http://jenkins.hexocube.fr/job/docker-suite/job/caddy/)
![Docker Pulls](https://img.shields.io/docker/pulls/dsuite/caddy.svg?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/dsuite/caddy.svg?style=flat-square)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/dsuite/caddy/latest.svg?style=flat-square)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/dsuite/caddy/latest.svg?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat-square)](https://opensource.org/licenses/MIT) -->

This image provides lots of pre-installed softwares while working on C++ / Go / Node / ... project.  
Thus, and this is an exception, this image is not built on top of [Alpine][alpine] but on top of [Debian Buster][debian buster].


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) Installed packages

| Package | Description |
|--|--|
|[ccache][ccache] | a fast C/C++ compiler cache
|[cmake][cmake] | CMake is an open-source, cross-platform family of tools designed to build, test and package software
|[doxygen][doxygen] | Generate documentation from source code
|[GNU gcc][gcc] | GCC, the GNU Compiler Collection
|[LLVM / Clang][clang] | The LLVM Project is a collection of modular and reusable compiler and toolchain technologies.
|[git][git] | Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
|[Go][goland] | Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.
| [jq][jq] | jq is a lightweight and flexible command-line JSON processor.
|[ninja][ninja] | Ninja is a small build system with a focus on speed.
|[Node.js][nodejs] | Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine.
|[nvm][nvm] | nvm is a version manager for node.js, designed to be installed per-user, and invoked per-shell. nvm works on any POSIX-compliant shell (sh, dash, ksh, zsh, bash), in particular on these platforms: unix, macOS, and windows WSL.
|[perl][perl] | Perl is a highly capable, feature-rich programming language.
|[Python3][python] | Python is a programming language that lets you work quickly and integrate systems more effectively.
|[ruby][ruby] | Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
|[Sphinx][sphinx] | Sphinx is a tool that makes it easy to create intelligent and beautiful documentation.

For a full list of installed softwares, check the Makefile.


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) WARNING

Considering all the installed packages, this image is very large



[alpine]: http://alpinelinux.org/
[debian buster]: https://www.debian.org/releases/buster/

[ccache]: https://ccache.dev/
[cmake]: https://cmake.org/
[clang]: https://llvm.org/
[doxygen]: https://www.doxygen.nl/index.html
[gcc]: https://gcc.gnu.org/
[git]: https://git-scm.com/
[goland]: https://golang.org/ 
[jq]: https://stedolan.github.io/jq/
[ninja]: https://ninja-build.org/
[nodejs]: https://nodejs.org/en/
[nvm]: https://github.com/nvm-sh/nvm
[perl]: https://www.perl.org/
[python]: https://www.python.org/
[ruby]: https://www.ruby-lang.org/
[sphinx]: https://www.sphinx-doc.org/
