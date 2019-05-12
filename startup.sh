set -ex

consul --version

# consul.hcl
mkdir --parents /etc/consul.d
touch /etc/consul.d/consul.hcl
chown --recursive consul:consul /etc/consul.d
chmod 640 /etc/consul.d/consul.hcl
echo '
datacenter = "mydc"
data_dir = "/opt/consul"
encrypt = "PBI0iEsM5iON6YtLoooGeg=="
performance {
  raft_multiplier = 1
}
retry_join = ["vm2", "vm0"]
connect {
    enabled = true
}
enable_script_checks = true
' > /etc/consul.d/consul.hcl

# server.hcl
mkdir --parents /etc/consul.d
touch /etc/consul.d/server.hcl
chown --recursive consul:consul /etc/consul.d
chmod 640 /etc/consul.d/server.hcl
echo '
server = true
bootstrap_expect = 3
ui = true
' > /etc/consul.d/server.hcl

/usr/sbin/sshd -D &
consul agent -config-dir /etc/consul.d -ui -client 0.0.0.0
