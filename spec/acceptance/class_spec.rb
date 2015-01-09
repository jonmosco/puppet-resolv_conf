require 'spec_helper_acceptance'

describe 'resolv_conf class' do

  context 'default parameters' do
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'resolv_conf': }
      EOS
      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
    end
    # Check that our file has the default vaules
    describe file("/etc/resolv.conf") do
      it { should be_file }
      it { should contain "nameserver 127.0.0.1" }
    end
  end
end
