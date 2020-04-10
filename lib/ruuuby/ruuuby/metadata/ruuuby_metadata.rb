# encoding: UTF-8

# -------------------------------------------- ⚠️ --------------------------------------------

module ::Ruuuby

  module MetaData

    def self.orm_meta ; ::Ruuuby::MetaData::RuuubyORM::SchemaORM  ; end

    def self.paths    ; ::Ruuuby::MetaData::Paths                 ; end

    def self.engine   ; ::Ruuuby::MetaData::RuuubyEngine.instance ; end

    # @return [Ruuuby::MetaData::RuuubyORM]
    def self.orm ; ::Ruuuby::MetaData::RuuubyORM.instance ; end

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
