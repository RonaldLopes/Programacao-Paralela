#Questao 5


def fatorial(valor)
	if(valor==1)
		return 1
	end

	return valor * fatorial(valor-1)
end
print "Digite um numero: "

puts fatorial gets.to_i 