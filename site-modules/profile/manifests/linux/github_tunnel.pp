# Uses the gabe-ngrok forge module to make a tunnel for CD4PE webhook.
class profile::linux::github_tunnel {
  class { 'ngrok':
    authtoken => '84fAzMWrconh6dpfd1kRb_3DBPbRkWkNPYjiBNQUYYQ',
  }
  ngrok::tunnel { 'cd4pe':
    proto => 'tcp',
    addr  => '8000',
  }
}
