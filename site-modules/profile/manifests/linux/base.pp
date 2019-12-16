# ...
class profile::linux::base {
#  include ntp
#  include profile::linux::login_banner
#  include profile::linux::dns_resolver
#  include profile::linux::hosts
#  include ::accounts
#  include os_patching
#  include profile::linux::qualys
}
