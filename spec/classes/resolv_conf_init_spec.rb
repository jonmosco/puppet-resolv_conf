require 'spec_helper'

describe 'resolv_conf' do
  it { should have_resource_count(1) }

  it do
    should contain_file('resolv.conf').with({
      'ensure' => 'file',
      'path'   => '/etc/resolv.conf',
      'owner'  => 0,
      'group'  => 0,
      'mode'   => '0644',
    })
  end

  context "with domain => localdomain" do
    let(:params) {{
      :domain => 'localdomain',
    }}
    it do
      should contain_file('resolv.conf').with \
        .with_content(/# resolv.conf: Managed by puppet\.\n#\ndomain localdomain\nnameserver 127.0.0.1/)
    end
  end

  context "with nameserver => 127.0.0.1" do
    let(:params) {{
      :nameserver => '127.0.0.1',
    }}
    it do
      should contain_file('resolv.conf').with \
        .with_content(/# resolv.conf: Managed by puppet\.\n#\nnameserver 127.0.0.1/)
    end
  end

  context "with search => localdomain" do
    let(:params) {{
      :search => 'localdomain',
    }}
    it do
      should contain_file('resolv.conf').with \
        .with_content(/# resolv.conf: Managed by puppet\.\n#\nsearch localdomain\nnameserver 127.0.0.1/)
    end
  end

end
