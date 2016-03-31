generate-ssl-cert
=================

Generate a self-signed OpenSSL keypair. The private key will stay on the 
remote server, and the certificate will be copied back to the Ansible controller
for distribution to other hosts.

Requirements
------------

* openssl

Role Variables
--------------

```
ssl_certificate_basename: default_certificate
ssl_certificate_directory: /etc/pki/tls
ssl_certificate_ip_address: "{{ ansible_default_ipv4.address }}"
ssl_certificate_bit_length: "2048"

# Role does not clobber existing keys with same name. Set
# the force option to true to clobber.
ssl_certificate_force_generate: false
```

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT
