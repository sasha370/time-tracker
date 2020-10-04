module PostsHelper

  # Метод, который возвращает посчитанный span
  # Обработку спрятали в privat чтобы спрятать методику обработки
  def status_badge status
    status_span_generator status
  end

  private

  # метод принимает значение статуса и возвращает span c цветным классом в зависимости от типа status
  def status_span_generator status
    case status
      when 'submitted'
        content_tag(:span, status.titleize , class: 'badge badge-primary') # ТЕГ, Текст тега, опции
      when 'approved'
        content_tag(:span, status.titleize , class: 'badge badge-success')
      when 'rejected'
        content_tag(:span, status.titleize , class: 'badge badge-danger')
    end
  end
end
