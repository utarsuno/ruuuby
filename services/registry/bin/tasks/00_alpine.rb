#!/usr/bin/env ruby
# utf-8

RUBYOPT='-Eutf-8 '
ENV['RUUUBY_F01']="b01|b03|b04{debug}"
require 'bundler/setup'
require 'ruuuby'

$ruuuby = 💎

$docker = 🐋
using ::Ruuuby::Heuristics::ContextParsingCommandOutput

require_relative '../../../../lib/ruuuby/protocol/abstract/rest_domain'
require_relative '../../lib/docker_registry'

$registry = ::Ruuuby::MetaData::DockerAPI::DockerRegistryAPI.new('localhost', '5000')

class PipelineDockerImage

  def initialize(local_image_name, repo, tag, relative_dir)
    @local_image_name = local_image_name
    @repo             = repo
    @tag              = tag
    @relative_dir     = relative_dir
  end

  def run
    local_image_exists = ::Docker::Image.∃?(@local_image_name)
    if local_image_exists
      💎.engine.debug("docker-image{#{@local_image_name}} exists")
    else
      💎.engine.debug("docker-image{#{@local_image_name}} did not exist")
      res = 💻("cd #{@relative_dir}; docker build --target=#{local_image_name} -t #{local_image_name} .")
      puts res
    end

    repo_image_exists = $registry.∃?(@repo, @tag)
    alt_name          = $registry.tag_name_for(@repo, @tag)
    if repo_image_exists
      💎.engine.debug("docker-registry-image{#{@repo}:#{@tag} exists")
    else
      💎.engine.debug("docker-registry-image{#{@repo}:#{@tag} did not exist, checking{#{alt_name}}")
      tagged_alt_exists = ::Docker::Image.∃?(alt_name)
      if tagged_alt_exists
        💎.engine.debug("docker-image{#{alt_name} exists")
      else
        💎.engine.debug("docker-image{#{alt_name} did not exist, tagging now")
        $registry.tag_image(@local_image_name, @repo, @tag) end

      $registry.upload(@repo, @tag)
    end
  end

end

$a = PipelineDockerImage.new('alpine_debugging', 'alpine', 'debugging', 'services/services/alpine/')
$a.run
