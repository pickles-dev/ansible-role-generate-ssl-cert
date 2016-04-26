require 'spec_helper'

describe package('openssl') do
  it { should be_installed }
end

describe file('/etc/pki/tls/certs') do
  it { should exist }
  it { should be_directory }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should eq '755' }
end

describe file('/etc/pki/tls/private') do
  it { should exist }
  it { should be_directory }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should eq '700' }
end

describe x509_certificate('/etc/pki/tls/certs/logstash-client.crt') do
  it { should be_certificate }
  it { should be_valid }
  its(:subject) { should eq '/C=AU/ST=Some-State/O=Internet Widgits Pty Ltd' }
  its(:keylength) { should be >= 2048 }
  its(:validity_in_days) { should_not be < 100 }
  its(:validity_in_days) { should be >= 100 }
  # Ostensibly a superfluous test, but if using custom values, only one test
  # will fail, and the others (e.g. '>= 100') will still pass, improving the
  # quality of the error output.
  its(:validity_in_days) { should be >= 3000 }
end
