require 'spec_helper'

describe 'resolv_conf' do

  it do
    should contain_file('resolv.conf').with({
      'ensure' => 'file',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0644',
    })
  end

end
