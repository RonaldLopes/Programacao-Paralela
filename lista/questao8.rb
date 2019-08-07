#Questao 8

def maiorValor2(vetor, maior = 0) # unico porem é que esse metodo  apaga o vetor original
	numero = vetor.pop
	if maior < numero
		maior = numero
	end
	if vetor.length == 0
		return maior
	end
	return maiorValor2(vetor, maior)
end

def maiorValor(vetor, maior = 0, posicao = 0) # Funciona sem apagar o vetor original
	if posicao == vetor.length
		return maior
	end
	if maior < vetor[posicao]
		maior = vetor[posicao]
	end
	return maiorValor(vetor, maior,posicao+1)
end

vetor = 20.times.map{Random.rand(0..1000)}
puts maiorValor vetor
print vetor