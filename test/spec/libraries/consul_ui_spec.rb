require 'spec_helper'
require_relative '../../../libraries/consul_ui'

describe ConsulCookbook::Resource::ConsulUI do
  step_into(:consul_ui)

  context 'consul ui install' do
    recipe 'consul_spec::consul_ui'

    it do is_expected.to create_libartifact_file('myconsul-ui-0.5.1')
      .with(owner: 'myconsul',group: 'myconsul',
            remote_url: "https://releases.hashicorp.com/consul/0.5.1/0.5.1_web_ui.zip",
            install_path: '/opt')
    end
  end
end
