require 'spec_helper'

describe "ClamAV install" do
  package('clamav') do
    it { should be_installed }
  end
end

describe 'clamav-unofficial-sigs setup' do
  config_dir = ANSIBLE_VARS.fetch('clamav_unofficial_sigs_config_dir', 'Fail')

  describe file(config_dir) do
    it { should be_directory }
  end

  describe file("#{config_dir}/master.conf") do
    it { should be_file }
  end

  describe file("#{config_dir}/os.conf") do
    it { should be_file }
  end

  describe file("#{config_dir}/user.conf") do
    it { should be_file }
    its(:content) { should include("sanesecurity_enabled=\"#{ANSIBLE_VARS.fetch('clamav_sigs_sanesecurity_enabled', 'FAIL')}\"") }
    its(:content) { should include("securiteinfo_enabled=\"#{ANSIBLE_VARS.fetch('clamav_sigs_securiteinfo_enabled', 'FAIL')}\"") }
    its(:content) { should include('user_configuration_complete="yes"') }
    its(:content) { should include('FOOOBAAR') }
  end
end
