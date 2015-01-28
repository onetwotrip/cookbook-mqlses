name             'cookbook-mqlses'
maintainer       'Twiket Ltd'
maintainer_email 'dmitry.medvedev@onetwotrip.com'
license          'Apache 2.0'
description      'Installs/Configures cookbook-mqlses'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu debian }.each do |os|
  supports os
end

depends 'apt'
depends 'java'
depends 'rabbitmq'
depends 'kibana-authentication-proxy'
