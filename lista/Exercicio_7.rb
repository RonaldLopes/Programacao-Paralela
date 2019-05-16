tamanho = 20
vetor = Array.new(tamanho)

for i in (0..tamanho-1)
	vetor[i] = rand(50)+1
end

puts "Vetor Antes"
print vetor
print "\n"

def organiza_vetor(vetor, ultima_posicao)
	divisores = 0
	indice = 0
	for i in (1..vetor[indice])
		if ((vetor[indice])% i) == 0
			divisores = divisores+1
		end
	end
	puts "Divisores"
	puts divisores
	if divisores==2
		aux = vetor[ultima_posicao]
		vetor[ultima_posicao] = vetor[indice]
		vetor[indice] = aux
	else

	end 
	#organiza_vetor((vetor, ultima_posicao))
	return vetor 
end

ultima_posicao = tamanho-1
vetor = organiza_vetor(vetor, ultima_posicao)

puts "Vetor Depois"
print vetor
print "\n"
