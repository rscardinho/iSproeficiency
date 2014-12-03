module ApplicationHelper
  def status(status)
    status.present? ? "Ativo" : "Inativo"
  end
end
