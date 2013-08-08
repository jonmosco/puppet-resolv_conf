#modulename

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with resolvconf](#setup)
    * [What resolvconf affects](#what-resolvconf-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with resolvconf](#beginning-with-resolvconf)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

The resolvconf module configures /etc/resolv.conf on Linux based systems.

##Module Description

If applicable, this section should have a brief description of the technology the module integrates with and what that integration enables. This section should answer the questions: "What does this module *do*?" and "Why would I use it?"

If your module has a range of functionality (installation, configuration, management, etc.) this is the time to mention it.

##Setup

###What resolvconf affects

* If the contents of /etc/resolv.conf are being managed by Network Manager, it will get overwritten

###Setup Requirements

This module assumes that the network configuration is not being managed by Network Manager.

###Beginning with resolver

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps for upgrading, you may wish to include an additional section here: Upgrading (For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

##Usage

Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here.

##Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

##Limitations

Tested on Debian and RedHat based Linux distributions.

##Development

This module follows the manual page provided on Linux systems.  If adding any options, please consult the man page first.

##Release Notes/Contributors/Etc

