= rubygems_checkcert

* http://rubyforge.org/projects/seattlerb

== DESCRIPTION:

Gem command to display the certificate of a gem, if any.

== FEATURES/PROBLEMS:

* Quickly display the signing certificate for a gem.
* Unfortunately, this currently only works with local gems.

== SYNOPSIS:

  % gem checkcert ZenTest

    Certificate:
        Data:
            Version: 3 (0x2)
            Serial Number: 0 (0x0)
            Signature Algorithm: sha1WithRSAEncryption
            Issuer: CN=ryand-ruby, DC=zenspider, DC=com
    ...

  % gem checkcert autotest
  ERROR:  Gem 'autotest' is not signed

== REQUIREMENTS:

* openssl

== INSTALL:

* sudo gem install rubygems-checkcert

== LICENSE:

(The MIT License)

Copyright (c) Ryan Davis, seattle.rb

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
