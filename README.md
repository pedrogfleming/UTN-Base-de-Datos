To run postgres on docker on a wsl distro, on powershell:
- wsl
Once connected to the wsl distro, on bash:
- docker-compose -f docker-compose.yaml up
To connect with a client db manager from windows host, use the following connectiong properties:
- host: 127.0.0.1
- port: 6543
- database utn-ejercicios
- user : admin
- password: 1234
The url can be used as follows:
jdbc:postgresql://127.0.0.1:6543/utn-ejercicios