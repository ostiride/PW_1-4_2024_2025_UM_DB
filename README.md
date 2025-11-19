# PROGETTAZIONE DELLO SCHEMA DI PERSISTENZA DEI DATI A SUPPORTO DEI SERVIZI DI UN’AZIENDA NEL SETTORE DEI TRASPORTI


Questo progetto nasce per gestire tutti i file necessari per il project work basato sul database di "Umbria Mobilità": lo scopo del lavoro
è stato strutturare un database relazionale progettato per supportare il processo di vendita, prenotazione, gestione e validazione dei biglietti ferroviari.

## Contenuto

Diagramma_ER_PW.png -- Diagramma ER che mostra solo entità e associazioni

Diagramma_ER_PW_con_attributi.png -- Diagramma ER con attributi

README.md

db_pw_umbria_mobilita.sql -- Database del progetto completo di dati

query_sql_pw.sql -- 

## Funzionalità supportate
1.	Recuperare il personale assegnato ad un viaggio.
2.	Simulare l'azione di un utente che inserisce il codice del suo biglietto per verificarne la validità, il posto assegnato e l'orario effettivo di viaggio, includendo l'eventuale stato di ritardo.
3.	Cercare un treno con la tariffa più economica entro una specifica fascia oraria, per una tratta definita.
4.	Recuperare lo storico completo di tutti i biglietti acquistati da un passeggero specifico, cercando tramite l’indirizzo email.
5.	Simulare la ricerca di un utente per un viaggio da una stazione A a una stazione B in una data specifica. La query recupera tutti i viaggi che soddisfano la richiesta e calcola l'orario esatto di partenza e arrivo per quel segmento.
6.	Generare la "lista passeggeri" ad uso del controllore per la verifica dei passeggeri a bordo. La query, dato un ID_Viaggio specifico, elenca tutti i passeggeri a bordo, con il loro posto e il segmento di viaggio che hanno acquistato.
7.	Verificare la validità di un abbonamento per la data corrente.
8.	Calcolare l'incasso totale e il numero di biglietti venduti per ogni tratta nell'ultimo mese. La query risulta utile all’eventuale direzione per conoscere quali sono le tratte più redditizie.
9.	Contare il numero di "eventi" (come ritardi o guasti) raggruppandoli per tratta, per capire quali linee generano più problemi.
10.	Fornito uno specifico evento “viaggio”, mostrare quanti posti sono liberi per la tratta specifica da una stazione di salita e quella di discesa, considerando che altri passeggeri possono occupare il posto per un segmento diverso.


---

© Francesco Ostili – Project Work Università Telematica Pegaso – CdS L-31 - Progettazione dello schema di persistenza dei dati a supporto dei servizi di un’azienda nel settore dei trasporti: Sviluppo di un database atto a supportare i processi operativi e decisionali nel trasporto locale su rotaia: Il caso “Umbria Mobilità”
