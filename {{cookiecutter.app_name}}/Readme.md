# {{cookiecutter.app_name}}

Supports: iOS 10.x and above

## Branches:

* master - stable app releases
* develop - development branch, merge your feature branches here

## Dependencies:

The project is using cocoapods for managing external libraries and a Gemfile for managing the cocoapods version.

Get Bundler

```
sudo gem install bundler
```

To install the specific cocoapods version run

```
bundle install
```

Then install the pods

```
bundle exec pod install
```

### Core Dependencies

* Swiftlint - A tool to enforce Swift style and conventions.
* R.swift - Get strong typed, autocompleted resources like images, fonts and segues in Swift projects

## Project structure:

* Resources - fonts, strings, images, generated files etc.
* SupportingFiles - configuration plist files
* Models - model objects
* Modules - contains app modules (UI + Code)
* Helpers - protocols, extension and utility classes

## Xcode templates
A set of standard module architecture xcode template are available in the XcodeTemplates folder.
To use the templates, copy the .xctemplates folders to:

```
~/Library/Developer/Xcode/Templates/File Templates/
```

After that you will be able to use those templates when creating new xcode modules.

[Example](./XcodeTemplates/template-usage.png)

You can read up more about xcode templates [here](http://jeanetienne.net/2017/09/10/xcode-templates.html)

The templates are intended as a starting point for good project architecture. You can modify/customize them if you see fit but make sure you use a template consistently for building new modules in the project. It greatly increases the readability and ease of working in the project for other developers.

## Tools

* Periphery - A static analysis tool for finding and removing unused code. The project has a special target setup (called Periphery) that will run the Periphery tool and search for dead code. Before running the tool please install Periphery through Homebrew and enable "legacy build system" because the tool brakes down on the new build system.
