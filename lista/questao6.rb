#Questao 6


def potencia (valor, expoente)
	if expoente == 1
		return valor
	end
	return valor * potencia(valor, expoente-1)
end
print "Informe o valor: "
valor = gets.to_i
print "Informe o expoente: "
expoente = gets.to_i
puts potencia(valor,expoente)