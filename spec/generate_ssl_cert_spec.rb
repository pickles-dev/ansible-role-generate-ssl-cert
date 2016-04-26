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
