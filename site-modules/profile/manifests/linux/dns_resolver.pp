# profile::linux::dns_resolver
#
# Support for managing DNS nameserver entries in /etc/resolv.conf
#
# @example Hiera data
#   profile::linux::dns_resolver::name_servers:
#     - '8.8.8.8'
#     - '8.8.4.4'
#
# @param name_servers Array of DNS name servers to manage on every agent node (set in common.yaml)
# @param search_path Array of domain search paths (set in common.yaml)
class profile::linux::dns_resolver (
  Array[String[1]] $name_servers,
  Array[String[1]] $search_path,
) {
  class { 'resolv_conf':
    nameservers => $name_servers,
    searchpath  => $search_path,
  }
}
