module ApplicationHelper

  # метод будет возвращать active в класс вкладки из которой вызван
  def active?(path)
    "active" if current_page?(path)

  end
end
