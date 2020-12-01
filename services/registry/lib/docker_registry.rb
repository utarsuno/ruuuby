# utf-8

# http://localhost:5000/v2/alpine/tags/list

module ::Ruuuby::MetaData
  class DockerAPI
    class DockerRegistryAPI < ::Ruuuby::Protocols::DomainREST

      # @param [String]          host
      # @param [Integer, String] port
      def initialize(protocol='http://', host='localhost', port='5000')
        super(protocol, host, port, nil, nil)
        @url             += '/v2/'
        @cached_repo_tags = {}
      end

      # @param [String] name_repo
      # @param [String] name_tag
      def upload(name_repo, name_tag)
        💻("docker push #{@host}:#{@base_port}/#{name_repo}:#{name_tag}")
      end

      # @param [String] name_repo
      # @param [String] name_tag
      #
      # @return [String]
      def tag_name_for(name_repo, name_tag); "#{@host}:#{@base_port}/#{name_repo}:#{name_tag}"; end

      # {"errors":[{"code":"NAME_UNKNOWN","message":"repository name not known to registry","detail":{"name":"js"}}]}

      def tag_image(name_og_image, name_repo, name_tag)
        docker_image = ::Docker::Image[name_og_image]
        unless docker_image.class == ::Docker::Image
          raise "unable to find docker image{#{name_og_image}}"
        end
        💻("docker tag #{docker_image.id.to_s} #{@host}:#{@base_port}/#{name_repo}:#{name_tag}")
      end

      # @ example response
      # # {"name"=>"alpine", "tags"=>["general", "latest", "debugging"]}
      #
      # @param [String] repo_name
      #
      # @return [Boolean]
      def repo_tags(repo_name)
        data = 🌐.get_json!("#{@url}#{repo_name}/tags/list")
        unless data.∃🔑?('errors')
          puts data
          tags                            = data['tags']
          @cached_repo_tags[data['name']] = tags
          tags
        end
      end

      # @param [String] name_repo
      # @param [String] name_tag
      #
      # @return [Boolean]
      def ∃?(name_repo, name_tag)
        unless @cached_repo_tags.∃🔑?(name_repo)
          self.repo_tags(name_repo)
        end
        unless @cached_repo_tags.∃🔑?(name_repo)
          return false
        end
        @cached_repo_tags[name_repo].∋?(name_tag)
      end

    end
  end
end
