include_recipe "ey-prechef"

execute "reload-systemd" do
  command "systemctl daemon-reload"
  action :nothing
end

execute "reload-monit" do
  command "monit reload"
  action :nothing
end

apt_update

package "openssl"

package "run-one" # Makes the run-one binary accessible across system, similar to lockrun in previous stack

package "net-tools" do
  action :install
end

package "iotop" do
  action :install
end

package "sysstat" do
  action :install
end

include_recipe "ey-sysctl::tune"
include_recipe "ey-core::swap"
include_recipe "ey-instance-api"
include_recipe "ey-syslog-ng"
include_recipe "ey-timezones"
include_recipe "ey-logrotate"
include_recipe "ey-hosts"
include_recipe "ey-core::sshd"
include_recipe "ey-unattended-upgrades"
  