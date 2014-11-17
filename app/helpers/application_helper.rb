module ApplicationHelper
	# Helper do menu_lateral_users
	def is_active?(link_path)
		current_page?(link_path) ? "active" : ""
	end

	# Formata a data conforme sua descricao
	def dia_mes_ano(date)
		date.strftime("%d/%m/%Y")
	end

	# Serve para exibir espacos
	def texto(s)
		s.gsub(/\n/, '<br>')
	end

end
