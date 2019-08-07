#vetor = [9,3,0,1,5,8,4,2,6,7]
vetor = [1,3,5,7,9,0,2,4,6,8]
#vetor = [0,1,2,3,4,5,6,7,8,9]

for i in (0..vetor.length-1)
	if (((i%2)!=0) && ((vetor[i]%2)!=0)) #Indice Impar e Valor Impar 
		for j in (i+1..vetor.length-1)
			if ((vetor[j]%2)==0)
				aux = vetor[i]
				vetor[i] = vetor[j]
				vetor[j] = aux
				# puts "Selection 1"
				# print vetor
				# print "\n"
			end
		end
	end
	if (((i%2)==0) && ((vetor[i]%2)==0)) #Indice Par e Valor Par
		for j in (i+1..vetor.length-1)
			if ((vetor[j]%2)!=0)
				aux = vetor[i]
				vetor[i] = vetor[j]
				vetor[j] = aux
				# puts "Selection 2"
				# print vetor
				# print "\n"
			end
		end
	end
end
puts "Vetor Organizado: #{vetor}"