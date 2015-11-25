	   identification division.
	   program-id. CARSELL.
	   author. Eru&Rafa.

	   environment division.
	   input-output section.
	   file-control.
	   		select optional fic assign "LIST.DAT"
	   		organization is line sequential.

	   data division.
	   file section.
	   fd fic.
	   01 registo.
	   		03 date-registo.
	   			05 ano pic 99.
	   			05 mes pic 99.
	   			05 dia pic 99.
	   		03 nome        pic a(20).
	   		03 contacto    pic 9(9).
	   		03 marca       pic a(15).
	   		03 modelo      pic x(10).
	   		03 ano-fabrico pic 9(4).
	   		03 matricula   pic x(6).
	   		03 km          pic 9(6).
	   		03 preco       pic 9(6)v99.

	   working-storage section.
	   77 opcao pic 9.
	   77 pausa pic x.
	   77 wmatr pic x(6).
	   77 wmarc pic a(15).
	   77 wkm   pic z9(5).
	   77 wprec pic z9(5).99.
	   77 soma  pic 9(7)v99.
	   77 cntar pic 99.
	   77 linha pic 99.
	   77 pagin pic 99 value 1.

	   screen section.
	   01 cabec.	
          05 cls blank screen.	  
          05 lista. 
              07 value "Nome" 
			  line 1 col 1.
              07 value "Contacto" 
			  line 1 col 18.
			  07 value "Marca" 
			  line 1 col 31.
              07 value "Modelo"
			  line 1 col 44.
              07 value "Ano"
			  line 1 col 56.
              07 value "matr"
			  line 1 col 61.
			  07 value "km"
			  line 1 col 68.
			  07 value "-----------------------------------"
			  line 2 col 15.
		05 vendas.
			  07 value "Marca"
			  line 1 col 1.
			  07 value "Modelo"
			  line 1 col 16.
			  07 value "Ano"
			  line 1 col 26.
			  07 value "Km"
			  line 1 col 31.
			  07 value "Preco"
			  line 1 col 37.
			  07 value "-----------------------------------"
			  line 2 col 15.

	   procedure division.
	   ecra.
	   		display cls.
			display "*** Menu ***".
			display "1 - Novo Registo".
			display "2 - Pesquisar P/Matricula".
			display "3 - Mostrar Tudo".
			display "4 - Pesquisar P/Marca".
			display "5 - Listagem Geral C/Iva Incluido".
			display "6 - Mostrar Viaturas de Fabrico < ao ano 2000".
			display "7 - Total de Viaturas Vendidas P/Marca".
			display "8 - Total P/Marca".
		 	display "9 - Maior Venda".
			display "0 - Sair".
			display "Digite a opcao que pretende".
	   		perform until opcao = 0
	   		accept opcao
	   		evaluate opcao
	   			when 1 go to registos
	   			when 2 go to pesquisa
	   			when 3 go to tudo
	   			when 4 go to marcas
	   			when 5 go to valores
	   			when 6 go to velhos
	   			when 7 go to vendas-marca
	   			when 8 go to total-marca
	   			when 9 go to maior
	   			when 0 go to fim
	   			when other go to ecra
	   		end-evaluate
	  		end-perform.
	   registos.
	   		display cls.
 	   		open extend fic.
	   		accept date-registo from date.
	   		display "Nome do cliente: ".
	   		accept nome.
	   		display "Contacto: ".
	   		accept contacto.
	   		display "Marca do veiculo: ".
	   		accept marca.
	   		display "Modelo do veiculo: ".
	   		accept modelo.
	   		display "Ano de fabrico: ".
	   		accept ano-fabrico.
	   		display "Matricula: ".
	   		accept matricula.
	   		display "Quilometragem atual: "
	   		accept km.
	   		display "Preco de Venda: "
	   		accept preco.

	   		write registo.
	   		close fic.
	   		display cls.
	   		display "Registo concluido".
	   		display "Quer fazer outro?(1-Sim | 2-Nao): ".
	   		accept pausa.
	   		if pausa = 1 then go to registos
	   		end-if.
	   		go ecra.
	   pesquisa.
	   		display cls.
	   		display "Qual a matricula?: ".
	   		accept wmatr.
	   		display cls.
	   		display lista.
	   		open input fic.
	   		perform until registo = high-values
	   			read fic
	   				at end move high-values to registo
	   			end-read
	   			if not registo = high-values
	   				if matricula = wmatr
	   				display nome space contacto space marca
	   				space modelo space ano-fabrico space 
	   				matricula space km
	   				end-if
	   			end-if
	   		end-perform.
	   		close fic.
	   		move low-values to registo.
	   		accept pausa.
	   		go ecra.
	   tudo.
	   		go ecra.
	   marcas.
	   		display cls.
	   		display "Qual a marca?: ".
	   		accept wmarc.
	   		open input fic.
	   		perform until registo = high-values
	   			read fic
	   				at end move high-values to registo
	   			end-read
	   			if not registo = high-values
	   				if marca = wmarc
	   				display "NADA"
	   				end-if
	   			end-if
	   		end-perform.
	   		close fic.
	   		move low-values to registo.
	   		accept pausa.
	   		go ecra.	
	   valores.
	   		go ecra.
	   velhos.
	   		display cls.
	   		open input fic.
	   		perform until registo = high-values
	   			read fic
	   				at end move high-values to registo
	   			end-read
	   			if not registo = high-values
	   				if ano-fabrico < 2000
	   				display "NADA"
	   				end-if
	   			end-if
	   		end-perform.
	   		close fic.
	   		move low-values to registo.
	   		accept pausa.
	   		go ecra.
	   vendas-marca.
	   		go ecra.
	   total-marca.
	   		go ecra.
	   maior.
	   		go ecra.
	   fim.
	   		stop run.
