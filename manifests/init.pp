# == class: resolv_conf
#
# == Parameters
#
# $domain
# Local domain

# $nameserver
# IP address in dot notation of your name servers
#
# $search
# Please refer to the resolv.conf(5) manual page
#
# $sortlist (optional)
# Optional parameter that defaults to your netmask
#
# $options (optional)
# Please refer to the resolv.conf(5) manual page
#
# == Authors
#
# Thomas Linkin <tom@puppetlabs.com>
# Jon Mosco <jonny.mosco@gmail.com>
#
class resolv_conf (
  $domain     = undef,
  $nameserver = '127.0.0.1',
  $search     = undef,
  $sortlist   = [],
  $options    = undef,
) {

  if is_string($nameserver) {
    $_nameserver = [$nameserver]
  } else {
    $_nameserver = $nameserver
  }

  if is_string($search) {
    $_search = [$search]
  } else {
    $_search = $search
  }

  validate_string($domain)
  validate_array($_nameserver)
  validate_array($_search)
  validate_array($sortlist)
  validate_string($options)

  if size($sortlist) > 10 {
    fail('sortlist can not contain more than 10 addresses')
  }

  file { 'resolv.conf':
    ensure  => file,
    path    => '/etc/resolv.conf',
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('resolv_conf/resolv.conf.erb'),
  }
}
