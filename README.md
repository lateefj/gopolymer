# gopolymer

## Embedded Polymer UI application in a Go binary

Yep it was time to document how to embbed an AJAX application into a Go binary :) I had experimented with it before however this was a lot of fun to finally write up a reall project with. First lets talk about some of the gaints that this project stands on.

* GB - http://getgb.io/ reproducable builds I mean come on get on the GB bus already!
* go.rice - https://github.com/GeertJohan/go.rice - How to this is where the magic happens.
* PolymerJS - https://www.polymer-project.org/1.0/ - Closes I have seen of a modern framework of components (legos) .


### Problem

I would be hard pressed to say that this came out of a specific problem. More of packing than anything else. In many ways CDN's handle large UI deployments I would guess however for the rest of them this is kinda a nice little hack. I am not sure exactly what problems are solved however I have a handful of ideas how this packaging could be use to make UI deployments easier. 

* Deploying a binary that hosts static files without Docker, nginx, Apache ect.
* Support for maintaince pages and basic dynamic things
* Go could be used as API gateway
* ???? 

### Usage

```bash

make all  # Ofcourse it uses make!!

./bin/{platform}_gopolyd # Probaly 
```

### Development

```bash
go run src/cmd/main.go
```
