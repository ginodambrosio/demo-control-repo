# profile::linux::login_banner
#
# Support for managing MOTD login banner
#
# @example Hiera data
#   profile::linux::login_banner::banner_content: "\n
#     \t\t\t !!  Warning  !! \n
#     ================================================================================ \n
#     Information stored or processed on this system is the property of Puppet\n
#     ================================================================================ \n
#     \n
#     "
#
# @param banner_content String containing login banner to manage on every agent node (set in common.yaml)
class profile::linux::login_banner(
  String $banner_content,
) {
  class { 'motd':
    issue_content => $banner_content,
  }
}
