# Dockerized DSO core

## About
The Dockerized DSO core project provides a Dockerfile template containing different package managers and runtimes (e.g. maven, npm...).
The file includes installation commands that allows creating a more suitable and customizable run environment for scanning projects/files.

The user has the ability to add/remove package managers according to his needs just by commenting/uncommenting 
relevant lines from the Dockerfile.

## Available runtimes in Dockerfile
0.  Ubuntu:18.04 (base image)
1.  required utility apps
2.  Java (1.8)
3.  Maven (3.5.4)
4.  Node.js (8.9.4)
5.  NPM (5.6.0)
6.  Yarn (1.5.1)
7.  Bower (1.8.2)
8.  Gradle (6.0.1)
9.  python 2.7 + 3.6 + pip + pip3 + pipenv
10. python 3.7
11. python 3.8
12. Poetry (python)
13. Ruby, rbenv and ruby-build
14. Go (1.12.6)
15. Scala 2.12.6, Sbt 1.1.6
16. PHP (7.2)
17. Composer
18. PHP Plugins
19. Mix, Hex, Erlang and Elixir
20. Cocoapods (1.5.3)
21. R + Packrat
22. Haskel + Cabal
23. Paket
24. dotnet-sdk-2.2,dotnet cli and NuGet
25. Cargo

#### Dockerfile
The Dockefile contains a list of languages and package managers installations.

Default installations are:
- utility apps
- java 1.8
- maven
- npm/ nodejs/ yarn
- gradle
- python 2.7, python3.6
- dotnet-sdk-2.2,dotnet cli and NuGet