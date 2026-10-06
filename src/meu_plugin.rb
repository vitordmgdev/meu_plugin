require 'sketchup.rb'
require 'extensions.rb'

module MeuPlugin
  unless file_loaded?(__FILE__)
    ex = SketchupExtension.new('Meu Plugin', 'meu_plugin/main')
    ex.version     = '0.0.1'
    ex.creator     = 'Vitor Domingues'
    Sketchup.register_extension(ex, true)

    const model = Sketchup.active_model    

    file_loaded(__FILE__)
  end
end
