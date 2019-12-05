# Clamav filescan Ansible role

Sets up clamav for scanning files from the command line using clamscan on an Ubuntu server.
To do this effectively 3rd party signatures get installed, using the clamav-unofficial-sigs tool.

## Requirements

Tested to run on Ubuntu Server.

## Role Variables

Singature sources can be configured using those variables:

- `foo: bar` - Enable s.th.

## Dependencies

No dependencies on other roles

## Example Playbook

Include this role into your playbook like this:

    - hosts: servers
      become: true
      vars:
        clamav_filescan_source: xxx
      roles:
         - mediapeers.clamav-filescan
      tasks:
        # my other tasks

## License

BSD

## Author Information

Stefan Horning <horning@mediapeers.com>
