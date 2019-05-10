#Questao 5


def fatorial(valor)
	if(valor==1)
		return 1
	end

	return valor * fatorial(valor-1)
end

puts fatorial 5