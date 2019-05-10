#Questao 4
def criaVetor(tamanho=30)
	vetor = Array.new(tamanho) { 0 }
	for i in 0..tamanho-1
		vetor[i]= Random.rand(0..1000)
	end
	return vetor
end

def ordenaVetor(vetor)
	for posicao in 0..vetor.length-1
		for i in posicao..vetor.length-1
			if vetor[posicao] > vetor[i]
				temp = vetor[i]
				vetor[i]= vetor[posicao]
				vetor[posicao] = temp
			end
		end
	end
end

# vetor = 30.times.map{Random.rand(0..1000)}
vetor = criaVetor 
print vetor
ordenaVetor vetor
print "\n"
print vetor