# Profile::Hosts
#
# Support for managing host entries in /etc/hosts
#
# @example Hiera data 
#   profile::linux::hosts::base_hosts:
#     'puppet.domain':
#       ensure: present
#       comment: 'Test Puppet Master'
#       ip: 172.16.25.217
#       host_aliases: puppet
#     'my_satellite_host.domain':
#       ensure: present
#       comment: 'Satellite server'
#       ip: 172.16.25.91
#       host_aliases: my_satellite
#
# @param base_hosts Hash of host resources to manage on every agent node (set in common.yaml)
# @param hosts Hash of additional host resources to manage on a specific node in addition to base_hosts (set in nodes/<fqdn>.yaml)

class profile::linux::hosts (
  Hash[String,Hash] $base_hosts = {},
  Hash[String,Hash] $hosts      = {},
){
  $this_host = {
    $facts['fqdn'] => {
      'ensure'     => 'present',
      'ip'         => $facts['ipaddress'],
      'host_aliases' => $facts['hostname'],
    }
  }

  merge(merge($base_hosts, $this_host), $hosts).each |$key, $opts| {
    host { $key:
      * => $opts
    }
  }
}
