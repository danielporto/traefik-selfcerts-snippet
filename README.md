# traefik-selfcerts-snippet

This is inspired by : https://github.com/BretFisher/compose-dev-tls


# Initial configuration

Copy the ```.env-example``` file to ```.env``` and customize it to suit your needs.
Notes: You can preclude the need to use the coredns container by using one of the public domain services that resolve the Wildcard to 127.0.0.1 (your machine local address). This will only work for deployment of all components locally (obviously) and useful for quick development.
```
cp .env-example .env
```

## Generate the certificates
The script ```certs.sh``` will generate the necessary certificate files. It will use the domain specified in the ```.env``` file, therefore if you change the domain, 
you must re-run this script to create new certificates.
```
./certs.sh
```
The certificates are stored into the ./certs directory.


## Install the certificates
It depends on the OS. Often, a double click on the .crt file suffices. Then, you must tell the OS to trust the certificate. Next, update the browser configuration to use system certificates.
Chrome does it automatically and doesn't require configuration. However, Firefox does require extra configuration.

# Testing
Open your preferred webbrower and access the two services: 

- https://nginx.localdev.vcap.me
- https://httpd.localdev.vcap.me
  
Change the domains accordingly if you updated the ```.env```.