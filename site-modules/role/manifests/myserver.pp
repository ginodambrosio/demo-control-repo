# This role would be made of all the profiles that need to be included to make a myserver work
# All roles should include the base profile
class role::myserver {
  include profile::base
}
