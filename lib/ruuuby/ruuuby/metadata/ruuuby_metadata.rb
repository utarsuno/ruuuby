# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  module MetaData

    # @return [Ruuuby::MetaData::RuuubyORM::SchemaORM]
    def self.orm_meta ; ::Ruuuby::MetaData::RuuubyORM::SchemaORM  ; end

    # @return [Ruuuby::MetaData::Paths]
    def self.paths    ; ::Ruuuby::MetaData::Paths                 ; end

    # @return [Ruuuby::MetaData::RuuubyEngine]
    def self.engine   ; ::Ruuuby::MetaData::RuuubyEngine.instance ; end

    # @return [Ruuuby::MetaData::RuuubyORM]
    def self.orm      ; ::Ruuuby::MetaData::RuuubyORM.instance    ; end

    # @return [Class] ::Ruuuby::Routine::CommandCLI
    def self.cli      ; ::Ruuuby::Routine::CommandCLI             ; end

    def self.info(content)
      🛑str❓(:content, content)
      💎.engine.logger.info(content)
    end

    def self.debug(content)
      🛑str❓(:content, content)
      💎.engine.logger.debug(content)
    end

  end

end

# -------------------------------------------- ⚠️ --------------------------------------------
