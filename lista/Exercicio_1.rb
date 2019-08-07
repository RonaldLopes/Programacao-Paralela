#Input das dimensões das Matrizes
#puts "Digite o número de linhas da Matriz A:"
linha = 4 #gets.to_i
#puts "Digite o número de colunas da Matriz A:"
coluna = 5 #gets.to_i

#Criação das Matrizes
matriz = Array.new(linha) {Array.new(coluna)}

#Matriz teste
#matriz = [[1, 1, 1, 1, 1],[1, 1, 1, 1, 1],[1, 1, 1, 1, 1],[1, 1, 1, 1, 1]]

def preenche_matriz(matriz,linha,coluna)
	for i in (0..linha-1)
		for j in (0..coluna-1)
			matriz[i][j] = rand(20)+1
		end
	end
end

def imprime_matriz (matriz,linha,coluna)
	puts "Matriz A #{linha}x#{coluna}"
	for i in (0..linha-1)
		print matriz[i]
		print "\n"
	end
end

def verifica_condicao (matriz, linha, coluna)
	somatorio = 0
	produtorio = 1
	min = 20*linha #Número máximo possível no somatório
	max = 0
	for j in (0..coluna-1)
		for i in (0..linha-1)
			somatorio += matriz[i][j]
		end
		if min > somatorio
			min = somatorio
		end
		somatorio = 0	
	end
	for i in (0..linha-1)
		for j in (0..coluna-1)
			produtorio = produtorio*matriz[i][j]
		end
		if max < produtorio
			max = produtorio
		end
		produtorio = 1
	end
	puts "Min: #{min}"
	puts "Max: #{max}"
	if min > max
		return "Condicao Nao Satisfeita"
	else
		return "Condicao Satisfeita"
	end
end

preenche_matriz(matriz,linha,coluna)
imprime_matriz(matriz,linha,coluna)
resposta = verifica_condicao(matriz, linha, coluna)

puts resposta