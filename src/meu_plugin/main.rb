require 'sketchup.rb'

module MeuPlugin
  unless file_loaded?(__FILE__)
    UI.menu('Plugins').add_item('Meu Plugin') do
      model = Sketchup.active_model

      UI.messagebox("Olá, SketchUp! Modelo: #{model.title}")
    end

    file_loaded(__FILE__)
  end
end
