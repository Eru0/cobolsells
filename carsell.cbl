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


