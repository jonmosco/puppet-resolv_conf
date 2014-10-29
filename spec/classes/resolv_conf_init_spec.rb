require 'spec_helper'

describe 'resolv_conf' do

  it do
    should contain_file('resolv.conf').with({
      'ensure' => 'file',
      'owner'  => 0,
      'group'  => 0,
      'mode'   => '0644',
    })
  end

  context "with nameserver => 127.0.0.1" do
    let(:params) {{
      :nameserver => '127.0.0.1',
    }}

    context "with domain => localdomain" do
      let(:params) {{
        :domain => 'localdomain',
      }}

      it do
        should contain_file('resolv.conf').with \
          .with_content(/# resolv.conf: Managed by puppet\.\n#\ndomain localdomain\nnameserver 127.0.0.1\n/)
      end
    end
  end
end
