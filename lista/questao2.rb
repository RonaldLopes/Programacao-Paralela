# Questao 2


matrix = [[1.0/3.0,(2*Math.sqrt(2))/3.0],[(2*Math.sqrt(2))/3.0,-1.0/3]]

def printaMatriz(matriz)
	for elemento in matriz
		print elemento
		print "\n"

	end
end

def calculaTransposta(matriz)
	retorno =Array.new(matriz[0].length){Array.new(matriz.length) { 0 }}
	for i in 0..(matriz.length-1)
		for j in 0..(matriz[0].length-1)
			retorno[j][i] = matriz[i][j]
		end
	end
	return retorno
end

def multiplicaMatriz(matriz)
	transposta = calculaTransposta(matriz)
	matrizMultiplicada = Array.new(matriz.length){ Array.new(transposta[0].length){0}}
	if (matriz[0].length == transposta.length)
		for i in 0..(matriz.length-1)
			for j in 0..(transposta[0].length-1)
				for k in 0..(matriz.length-1)
					matrizMultiplicada[i][j]= ((matriz[i][k]*transposta[k][j]) + matrizMultiplicada[i][j])
				end
			end
		end
		return matrizMultiplicada
	else
		puts "Nao é possivel fazer  a multiplicacao"
		return nil
	end
end

def verificaOrtogonalidade(matriz)
	identidade = geraIdentidade(matriz)
	multiplicada = multiplicaMatriz matriz

	if comparaMatrizes(multiplicada, identidade)==true
	 	puts "É ortogonal"
	else
		puts "Não é ortogonal"
	end 
end

def comparaMatrizes(a,b)  #se comparar direto da uma diferença devido ao numero de casa decimais
	for i in 0..a.length-1
		for j in 0..a.length-1
			if a[i][j].to_f.floor(14) != b[i][j].to_f.floor(14)
				return false
			end
		end
	end
	return true
end

def geraIdentidade(matriz)
	identidade = Array.new(matriz.length){Array.new(matriz.length) { 0 }}
	for i in 0..(matriz.length-1)
		for j in 0..(matriz.length-1)
			if i == j
				identidade[i][j] = 1
			end
		end
	end
	return identidade
end

verificaOrtogonalidade matrix