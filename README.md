# [gopolymer](http://gopolymer.lhj.me/)

## Embedded Polymer UI application in a Go binary

![You can put your Javascript UI in there](http://i51.photobucket.com/albums/f381/goldspider/Fark/outofafrica1.jpg "You can put your Javascript UI in there")

Yep it was time to document how to embed an AJAX application into a Go binary :). I had experimented with embedding Javascript app into a Go binary before however not a Polymer app. This was a lot of fun to finally document how to use a Makefile to reliably build and embed static files.

First lets talk about some of the gaints that this project stands on:

* GB - http://getgb.io/ reproducable builds I mean come on get on the GB bus already!
* go.rice - https://github.com/GeertJohan/go.rice - How to this is where the magic happens.
* PolymerJS - https://www.polymer-project.org/1.0/ - Closest I have seen of a modern framework of components (legos) .


Check the [gopolymer Demo App](http://gopolymer.lhj.me/)

### Problem

The process of deploying a static javascript web site is not difficult however it lacks my love for the simplicity of deploying a Go binary. Go has made this a lot easier however it still means passing a parameter at runtime with which directory to host the static files. If I could only scp up a single binary that contained everything the application needed including static files. In the past runtime permissions constrained which static files a user could load (which corresponded to features).

* Deploying a binary that hosts static files without Docker, nginx, Apache ect.
* Security constrained javascript functionaltiy
* Dynamically display maintenance pages
* Repeatable builds of both AJAX API and UI code that is easy to release and rollback


Your ideas?


### Solution

#### Makefile: its what built the tools (Java, Python, Ruby, Javascript, Node ect) you use why not use it?

In recent memory I have used using the 3 different build tools for Java (ant, maven, gradle), 3 Javascript build tools (YUI Compressor, GWT, Gulp), rake, fabric and shell scripts. Make is refreshingly simple in comparission.

#### GB: Go repeatable builds yeah!

Dave is awesome http://getgb.io/. I find keeping my code on the internets in 2015 is obvious thanks to Go. GB extends the simplicity and use of the internets to create a repeatable build. This blog seems to have the best docs: http://dave.cheney.net/2015/06/09/gb-a-project-based-build-tool-for-the-go-programming-language

#### Polymer: Its like Legos!

Javascript frameworks of late seem sound great "write less code" but in the end produce monolithic hard to reason with applications. I grew up with building things out of Legos and to this day I still find it is the best way to build software. The playing around with Polymer most reminds me of the ability create larger and larger components based on the standard of webcomponents. I mean the cwidget library is an element chart: https://elements.polymer-project.org/ !!!!


#### Missing Pieces: It is not all a bed of roses

* GB dependency finder: Searches code and vendors packages (maybe exists could use better docs)
* Polymer compressor: Compiles javascript / html to fewer files to improve load time (maybe exists just could use better docs)
* Package and deployment: I have searched for a _good_ tool to use for deployment pipeline. Thinking maybe I need to make a stab at it. 


### Usage

```bash

make build  # Ofcourse it uses make!!

./bin/gopolyd # Probably

```

### Development

```bash
go run src/cmd/main.go
```
