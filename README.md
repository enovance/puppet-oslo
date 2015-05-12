puppet-oslo
===========

#### Table of Contents

1. [Overview - What is the oslo module?](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with oslo](#setup)
4. [Implementation - An under-the-hood peek at what the module is doing](#implementation)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Contributors - Those with commits](#contributors)
8. [Release Notes - Notes on the most recent updates to the module](#release-notes)

Overview
--------

The oslo module is a part of [Stackforge](https://github.com/stackforge),
an effort by the Openstack infrastructure team to provide continuous integration
testing and code review for Openstack and Openstack community projects not part
of the core software.  The module itself is used to expose Oslo configurations consummed
by other Openstack modules. Itcan be utilized to avoid code duplication and ensure
code consistency.

Module Description
------------------

The oslo module is used to configure Oslo sections in OpenStack configuration files.
Example: Oslo messaging, logging, etc.


Setup
-----

### Installing puppet-oslo

    example% puppet module install puppetlabs/oslo


Implementation
--------------

### puppet-oslo

oslo is a combination of Puppet manifest and ruby code to deliver
Oslo projects configuration through types and providers.

Limitations
-----------

None


Development
-----------

Developer documentation for the entire puppet-openstack project.

* https://wiki.openstack.org/wiki/Puppet-openstack#Developer_documentation

Contributors
------------

* https://github.com/stackforge/puppet-oslo/graphs/contributors
