module ApplicationHelper
  def languages_option
    Language.all.map { |language| [language.name, language.id] }
  end
end
