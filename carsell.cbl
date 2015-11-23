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
	   		02 data_registo.
	   			05 dia pic 99.
	   			05 mes pic 99.
	   			05 ano pic 9999.
