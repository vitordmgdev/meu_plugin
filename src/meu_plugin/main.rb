require 'sketchup.rb'
require_relative 'test'

module MeuPlugin
  unless file_loaded?(__FILE__)
    abrir_projeto = UI::Command.new("Projetos") do
      UI.messagebox('Abrindo projetos')

      UI::HtmlDialog
    end

    abrir_projeto.tooltip = "Abrir projetos"
    abrir_projeto.status_bar_text = "Gerenciar projetos"

    toolbar = UI::Toolbar.new("Marcenar")

    toolbar.add_item(abrir_projeto)

    toolbar.show

    file_loaded(__FILE__)
  end
end
