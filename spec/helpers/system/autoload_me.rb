# utf-8

ENV['RSPEC_SYSTEM'] = 'on'

::RSpec.shared_context 'shared_context_f40' do

  # @param [String]  container_name
  # @param [Boolean] expect_tty
  # @param [String]  expected_os
  # @param [String]  expected_os_version
  #
  # @return [Docker::Container]
  def audit_container(container_name, expect_tty, expected_os, expected_os_version)
    container = 🐋[container_name]
    expect(container.ⓣ).to eq(::Docker::Container)
    expect(container.id.ⓣ).to eq(::String)

    container_by_id = 🐋.find_🐋_by_id(container.id)
    expect(container_by_id.ⓣ).to eq(::Docker::Container)
    expect(container_by_id.id.ⓣ).to eq(::String)

    # different Ruby objects that are representing the same `Docker Container`
    expect(container.id).to     eq(container_by_id.id)
    expect(container.🆔).to_not eq(container_by_id.🆔)

    expect(container.env_vars).to eq(container_by_id.env_vars)

    short_name = container.env_vars['SERVICE_NAME']
    if short_name.end_with?('_dev')
      short_name = short_name[0..short_name.length-5]
    elsif short_name.end_with?('_test') || short_name.end_with?('_prod')
      short_name = short_name[0..short_name.length-6]
    end

    expect(container.env_vars['SERVICE_NAME']).to eq(short_name)

    if expected_os == 'alpine'
      expect(container.alpine?).to eq(true)
      expect(container.debian?).to eq(false)

      os_release = container.os_release
      expect(os_release['PRETTY_NAME']).to eq("Alpine Linux v#{expected_os_version.♻️⟵('.')}")
      expect(os_release['NAME']).to eq('Alpine Linux')
      expect(os_release['VERSION_ID']).to eq("#{expected_os_version}")
      expect(os_release['ID']).to eq('alpine')
      expect(os_release['HOME_URL']).to eq('https://alpinelinux.org/')
      expect(os_release['BUG_REPORT_URL']).to eq('https://bugs.alpinelinux.org/')

      unless container_name.include?('pgadmin') || container_name.include?('postgres')
        expect(container.os_architecture).to eq('musl-linux-amd64')
      end
    else
      expect(container.alpine?).to eq(false)
      expect(container.debian?).to eq(true)
    end
    expect(container.os_version).to eq(expected_os_version)

    expect(container.tty?).to eq(expect_tty)

    return container
  end

end
