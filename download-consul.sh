if ! [ -f ./consul ]; then
    curl -o ./consul.zip "https://releases.hashicorp.com/consul/1.5.0/consul_1.5.0_linux_amd64.zip"
    unzip consul.zip -d .
fi