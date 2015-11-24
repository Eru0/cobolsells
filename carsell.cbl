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
	   		03 data_registo.
	   			05 dia pic 99.
	   			05 mes pic 99.
	   			05 ano pic 9(4).
	   		03 matricula   pic x(6).
	   		03 nome        pic a(15).
	   		03 marca       pic a(15).
	   		03 modelo      pic x(10).
	   		03 contacto    pic 9(9).
	   		03 ano_fabrico pic 9(4).

	   working-storage section.
	   77 opcao pic 9.

	   screen section.
	   01 cls blank screen.

	   procedure division.
	   ecra.
	   		perform until opcao = 0
	   		evaluate opcao
	   			when 1 go to registo
	   			when 2 go to pesquisa
	   			when 3 go to escrita
	   			when 4 go to marcas
	   			when 5 go to valores
	   			when 6 go to velhos
	   			when 7 go to vendas_marca
	   			when 8 go to total_marca
	   			when 9 go to maior.
	   			when other go to ecra
	   		end-evaluate
	  		end-perform.
	   registo.
	   pesquisa.
	   escrita.
	   marcas.
	   valores.
	   velhos.
	   vendas_marca.
	   total_marca.
	   maior.
	   fim.
	   stop run.


