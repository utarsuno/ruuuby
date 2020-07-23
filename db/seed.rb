# coding: UTF-8

if 💎.engine.orm.nil?
  💎.engine.enable_orm
end

💎.engine.orm.ensure_loaded_seeds(true)
