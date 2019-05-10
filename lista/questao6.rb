#Questao 6


def potencia (valor, expoente)
	if expoente == 1
		return valor
	end
	return valor * potencia(valor, expoente-1)
end

puts potencia(2,5000)