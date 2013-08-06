# /etc/resolv.conf management
#
# Very early design
#
# Include safe defaults
#
class resolver (
  $nameserver = '127.0.0.1',
  $domain     = undef,
  $search     = undef,
  $sortlist   = [],
  $options    = undef,
) {

  if is_string($nameserver) {
    $_nameserver = [$nameserver]
  } else {
    $_nameserver = $nameserver
  }

  validate_array($_nameserver)
  validate_string($domain)
  validate_slength($search, 256)
  validate_array($sortlist)

  if count($sortlist) > 10 {
    fail('sortlist can not contain more than 10 addresses')
  }

  file { 'resolv.conf':
    ensure  => file,
    path    => '/etc/resolv.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('resolver/resolv.conf.erb'),
  }
}
