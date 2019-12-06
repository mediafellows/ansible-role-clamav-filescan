[![Build Status](https://travis-ci.com/mediapeers/ansible-role-clamav-filescan.svg?branch=master)](https://travis-ci.com/mediapeers/ansible-role-clamav-filescan)

# Clamav filescan Ansible role

Sets up clamav for scanning files from the command line using clamscan on an Ubuntu server.
To do this effectively 3rd party signatures get installed, using the [clamav-unofficial-sigs](https://github.com/extremeshok/clamav-unofficial-sigs) tool.

## Requirements

Tested to run on Ubuntu Server.

## Role Variables

Variables in this role are mostly for configuring the clamav-unofficial-sigs tool.
For all varaibles checkout `defaults/main.yml`.

Those are the most important you probably want to set:

- `clamav_sigs_false_positive_risk_level: MEDIUM` - The false positive rating of sources. Set either LOW, MEDIUM or HIGH
- `clamav_sigs_sanesecurity_enabled: 'yes'` - Set to `'no'` to disable the Sanesecurity.com signature DB
- `clamav_sigs_securiteinfo_enabled: 'no'` - Set to `'yes'` to enable the SecuriteInfo.com signature DB, also set `securiteinfo_authorisation_signature` then
- `clamav_sigs_yararulesproject_enabled: 'yes'` - Set to `'yes'` to enable [Yara-Rules Project](https://github.com/Yara-Rules/rules) signatures.
- `clamav_sigs_linuxmalwaredetect_enabled: 'yes'` - Set to `'no'` to disable [Linuxmalwaredetect](https://www.rfxn.com/projects/linux-malware-detect/) DB.
- `clamav_sigs_malwarepatrol_enabled: 'yes'` - Set to `'no'` to disable MalwarePatrol.net rules
- `securiteinfo_authorisation_signature: ABC123ABC123` - Set to your Securiteinfo download token (otherwise this DB won't be used)
- `malwarepatrol_receipt_code: ABC123ABC123` - Set to your MalwarePatrol receipt code to enable their commercial signatures, also set the `malwarepatrol_product_code` to your product code

**NOTE:** to not turn `yes` and `no` into booleans and thus resolve to True and False in templates, use quotes to keep them as strings. Like `'yes'` or `"no"`.

## Dependencies

No dependencies on other roles

## Example Playbook

Include this role into your playbook like this:

    - hosts: servers
      become: true
      vars:
        clamav_sigs_sanesecurity_enabled: 'no'
      roles:
         - mediapeers.clamav-filescan
      tasks:
        # my other tasks

## License

BSD

## Author Information

Stefan Horning <horning@mediapeers.com>
