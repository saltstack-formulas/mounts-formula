======
mounts
======

.. note::

    See the full `Salt Formulas installation and usage instructions <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``mounts``
----------

Mounts a given device/location

Using the ``format`` option will format the specified device as ext4 if the device is not already formatted. At present it uses a stateful bash script to do this due to a `bug <https://github.com/saltstack/salt/issues/31033>`_ in ``blockdev.formatted`` which will be fixed in Salt Carbon.

Testing
=======

Testing is done with kitchen-salt

``kitchen converge``
--------------------

Runs the formula

``kitchen verify``
------------------

Runs serverspec tests on the actual instance

``kitchen test``
----------------

Builds and runs test from scratch

``kitchen login``
-----------------

Gives you ssh to the vagrant machine for manual testing
