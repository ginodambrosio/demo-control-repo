# profile::linux::qualys
#
# Support for configuring Qualys agent
#
# @example Hiera data
#   profile::linux::qualys::activation_id: ''
#   profile::linux::qualys::customer_id: ''
#
# @param activation_id String representing Qualys agent Activation ID (set in common.yaml)
# @param customer_id String representing Qualys agent Customer ID (set in common.yaml)
class profile::linux::qualys (
  String $activation_id,
  String $customer_id,
) {
#
# Remove the package resource below once a local yumrepo is in place and qualys-cloud-agent is 
# available through yum install.
#
#  package { 'qualys_cloud_agent':
#    ensure => installed,
#    provider => 'rpm',
#    source => 'http:///qualys-cloud-agent-2.1.0.91.rpm',
#  }
  class { 'qualys_agent':
    activation_id => $activation_id,
    customer_id   => $customer_id,
  }
}
