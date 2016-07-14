require 'serverspec'

set :backend, :exec

# Test things have mounted/unmounted
describe file('/mnt') do
  it { should be_mounted }
end

describe file('/data') do
  it { should be_mounted }
end

# Check they are written to /etc/fstab
describe file('/mnt/blah') do
  it { should_not be_mounted }
end

describe file('/etc/fstab') do
  its(:content) { should match /^\/dev\/sdb\s*\/mnt\s*ext4\s*defaults\s*0\s*0/ }
end

describe file('/etc/fstab') do
  its(:content) { should match /^\/dev\/sdc\s*\/data\s*ext4\s*defaults\s*0\s*0/ }
end

describe file('/etc/fstab') do
  its(:content) { should_not match /^\/dev\/sde\s*\/mnt\/blah.*/ }
end
