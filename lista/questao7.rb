#Questao 7

def criaVetor(tamanho=20)
	vetor = Array.new(tamanho) { 0 }
	for i in 0..tamanho-1
		vetor[i]= Random.rand(2..30)
	end
	return vetor
end

def ordenaNumerosCompostos(vetor, posicao=0, ultimo = -1)
	if posicao == vetor.length-1 or (vetor.length+ultimo) == posicao
		return
	end
	# puts "Posicao: #{posicao} | ultimo: #{ultimo} | vetor: #{vetor}"
	if(verificaNumeroComposto(vetor[posicao])==false)
		temp = vetor[posicao]
		vetor[posicao] = vetor[ultimo]
		vetor[ultimo] = temp
		ordenaNumerosCompostos(vetor,posicao,ultimo-1)
	else
		ordenaNumerosCompostos(vetor,posicao+1,ultimo)
	end
end

def verificaNumeroComposto(numero)
	# puts numero
	numeroDivisoes=0
	for i in 1..numero
		if ((numero%i) == 0) 
			numeroDivisoes = numeroDivisoes +1 
		end
	end
	(numeroDivisoes > 2) ? (return true) : (return false)
end


v = criaVetor
ordenaNumerosCompostos v 
puts "Vetor: #{v}"