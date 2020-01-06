# Uses the gabe-ngrok forge module to make a tunnel for CD4PE webhook.
class profile::linux::github_tunnel (
  String $ngrok_authtoken,
) {
  class { 'ngrok':
    authtoken => $ngrok_authtoken,
  }
  ngrok::tunnel { 'cd4pe':
    proto => 'tcp',
    addr  => '8000',
  }
}
