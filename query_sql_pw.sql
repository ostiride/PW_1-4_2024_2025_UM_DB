/*1.	Recuperare il personale assegnato ad un viaggio. */
SELECT d.Nome, d.Cognome
FROM DIPENDENTE AS d
JOIN ASSEGNAZIONE_TURNO AS a ON d.ID_Dipendente = a.ID_Dipendente
WHERE a.ID_Viaggio = 7;

/*2.    Recuperare lo storico completo di tutti i biglietti acquistati da un passeggero specifico, tramite la sua email.*/
SELECT v.DataOraPartenzaPrevista, t.NomeTratta, s_part.NomeStazione AS StazioneDiPartenza,
 s_arr.NomeStazione AS StazioneDiArrivo, b.PostoAssegnato, b.PrezzoPagato
FROM PASSEGGERO AS p
JOIN BIGLIETTO AS b ON p.ID_Passeggero = b.ID_Passeggero
JOIN VIAGGIO AS v ON b.ID_Viaggio = v.ID_Viaggio
JOIN TRATTA AS t ON v.ID_Tratta = t.ID_Tratta
JOIN FERMATA AS f_part ON v.ID_Tratta = f_part.ID_Tratta AND b.Ordine_Fermata_Partenza = f_part.Ordine
JOIN STAZIONE AS s_part ON f_part.ID_Stazione = s_part.ID_Stazione
JOIN FERMATA AS f_arr ON v.ID_Tratta = f_arr.ID_Tratta AND b.Ordine_Fermata_Arrivo = f_arr.Ordine
JOIN STAZIONE AS s_arr ON f_arr.ID_Stazione = s_arr.ID_Stazione
WHERE p.Email = 'mario.rossi@email.it'
ORDER BY v.DataOraPartenzaPrevista DESC;


/*3.	Cercare un treno con la tariffa più economica entro una specifica fascia oraria, per una tratta definita.*/
SELECT v.ID_Viaggio, v.DataOraPartenzaPrevista, v.DataOraArrivoPrevista, 
    (   SELECT MIN(b.PrezzoPagato) 
        FROM BIGLIETTO AS b 
        WHERE b.ID_Viaggio = v.ID_Viaggio
    ) AS PrezzoMinimoAttuale,   
    m.CapacitaMax - 
    (   SELECT COUNT(b.ID_Biglietto) 
        FROM BIGLIETTO AS b 
        WHERE b.ID_Viaggio = v.ID_Viaggio
    ) AS PostiResidui
FROM VIAGGIO AS v
JOIN TRATTA AS t ON v.ID_Tratta = t.ID_Tratta
JOIN MEZZO AS m ON v.ID_Mezzo = m.ID_Mezzo
WHERE t.NomeTratta = 'Perugia - Terni' AND DATE(v.DataOraPartenzaPrevista) = CURDATE() 
    AND TIME(v.DataOraPartenzaPrevista) BETWEEN '07:00:00' AND '09:00:00'
ORDER BY v.DataOraPartenzaPrevista ASC;

/* 4.	Recuperare lo storico completo di tutti i biglietti acquistati da un passeggero specifico, cercando tramite l’indirizzo email.*/
SELECT v.DataOraPartenzaPrevista, t.NomeTratta, s_part.NomeStazione AS StazioneDiPartenza, s_arr.NomeStazione AS StazioneDiArrivo, 
 b.PostoAssegnato, b.PrezzoPagato
FROM PASSEGGERO AS p
JOIN BIGLIETTO AS b ON p.ID_Passeggero = b.ID_Passeggero
JOIN VIAGGIO AS v ON b.ID_Viaggio = v.ID_Viaggio
JOIN TRATTA AS t ON v.ID_Tratta = t.ID_Tratta
JOIN FERMATA AS f_part ON v.ID_Tratta = f_part.ID_Tratta AND b.Ordine_Fermata_Partenza = f_part.Ordine
JOIN STAZIONE AS s_part ON f_part.ID_Stazione = s_part.ID_Stazione
JOIN FERMATA AS f_arr ON v.ID_Tratta = f_arr.ID_Tratta AND b.Ordine_Fermata_Arrivo = f_arr.Ordine
JOIN STAZIONE AS s_arr ON f_arr.ID_Stazione = s_arr.ID_Stazione
WHERE p.Email = 'mario.rossi@email.it'
ORDER BY v.DataOraPartenzaPrevista DESC;

/*5.	Simulare la ricerca di un utente per un viaggio da una stazione A a una stazione B in una data specifica. 
La query recupera tutti i viaggi che soddisfano la richiesta e calcola l'orario esatto di partenza e arrivo per quel segmento. */

-- Impostazione delle variabili di ricerca
SET @data_ricerca = '2025-12-01';
SET @stazione_partenza_nome = 'Perugia Ponte San Giovanni';
SET @stazione_arrivo_nome = 'Todi Ponte Rio';

SELECT v.ID_Viaggio, t.NomeTratta, t.TipoServizio,
    -- Calcolare l'orario di partenza effettivo da quella fermata
    (v.DataOraPartenzaPrevista + INTERVAL f_part.TempoPartenzaRelativo MINUTE) AS OrarioPartenzaEffettivo,
    -- Calcolare l'orario di arrivo effettivo a quella fermata
    (v.DataOraPartenzaPrevista + INTERVAL f_arr.TempoArrivoRelativo MINUTE) AS OrarioArrivoEffettivo
FROM STAZIONE AS s_part
JOIN FERMATA AS f_part ON s_part.ID_Stazione = f_part.ID_Stazione
JOIN STAZIONE AS s_arr ON s_arr.NomeStazione = @stazione_arrivo_nome
JOIN FERMATA AS f_arr ON s_arr.ID_Stazione = f_arr.ID_Stazione AND f_part.ID_Tratta = f_arr.ID_Tratta
JOIN VIAGGIO AS v ON f_part.ID_Tratta = v.ID_Tratta
JOIN TRATTA AS t ON v.ID_Tratta = t.ID_Tratta
WHERE s_part.NomeStazione = @stazione_partenza_nome AND f_part.Ordine < f_arr.Ordine AND DATE(v.DataOraPartenzaPrevista) = @data_ricerca;

/*6.	Generare la "lista passeggeri" ad uso del controllore per la verifica dei passeggeri a bordo. 
La query, dato un ID_Viaggio specifico, elenca tutti i passeggeri a bordo, con il loro posto e il segmento di viaggio che hanno acquistato.*/

SELECT p.Nome, p.Cognome, b.PostoAssegnato, s_part.NomeStazione AS Da, s_arr.NomeStazione AS A
FROM BIGLIETTO AS b
JOIN PASSEGGERO AS p ON b.ID_Passeggero = p.ID_Passeggero
JOIN VIAGGIO AS v ON b.ID_Viaggio = v.ID_Viaggio
JOIN FERMATA AS f_part ON v.ID_Tratta = f_part.ID_Tratta AND b.Ordine_Fermata_Partenza = f_part.Ordine
JOIN STAZIONE AS s_part ON f_part.ID_Stazione = s_part.ID_Stazione
JOIN FERMATA AS f_arr ON v.ID_Tratta = f_arr.ID_Tratta AND b.Ordine_Fermata_Arrivo = f_arr.Ordine
JOIN STAZIONE AS s_arr ON f_arr.ID_Stazione = s_arr.ID_Stazione
WHERE b.ID_Viaggio = 1
ORDER BY b.Ordine_Fermata_Partenza, b.PostoAssegnato;

/*7.	Verificare la validità di un abbonamento per la data corrente.*/

SELECT p.Nome, p.Cognome, a.ID_Abbonamento, a.TipoDurata, s_a.NomeStazione AS OrigineAbbonamento, s_b.NomeStazione AS DestinazioneAbbonamento,
    a.DataInizioValidita,  a.DataFineValidita
FROM PASSEGGERO AS p
JOIN ABBONAMENTO AS a ON p.ID_Passeggero = a.ID_Passeggero
JOIN CATALOGO_ABBONAMENTI AS ca ON a.ID_Catalogo = ca.ID_Catalogo
JOIN STAZIONE AS s_a ON ca.ID_Stazione_A = s_a.ID_Stazione
JOIN STAZIONE AS s_b ON ca.ID_Stazione_B = s_b.ID_Stazione
WHERE p.Email = 'mario.rossi@email.it'AND CURDATE() BETWEEN a.DataInizioValidita AND a.DataFineValidita;

/*8.	Calcolare l'incasso totale e il numero di biglietti venduti per ogni tratta nell'ultimo mese. 
La query risulta utile all’eventuale direzione per conoscere quali sono le tratte più redditizie.*/
SELECT t.NomeTratta, t.TipoServizio, COUNT(b.ID_Biglietto) AS NumeroBigliettiVenduti, SUM(b.PrezzoPagato) AS IncassoTotale
FROM BIGLIETTO AS b
JOIN VIAGGIO AS v ON b.ID_Viaggio = v.ID_Viaggio
JOIN TRATTA AS t ON v.ID_Tratta = t.ID_Tratta
WHERE v.DataOraPartenzaPrevista >= NOW() - INTERVAL 1 MONTH
GROUP BY t.ID_Tratta, t.NomeTratta, t.TipoServizio
ORDER BY IncassoTotale DESC;

/*9.	Contare il numero di "eventi" (come ritardi o guasti) raggruppandoli per tratta, per capire quali linee generano più problemi.*/

SELECT t.NomeTratta, t.TipoServizio, COUNT(ev.ID_Evento) AS NumeroProblemiRegistrati
FROM TRATTA AS t
JOIN VIAGGIO AS v ON t.ID_Tratta = v.ID_Tratta
JOIN EVENTO_VIAGGIO AS ev ON v.ID_Viaggio = ev.ID_Viaggio
WHERE ev.TipoEvento IN ('Ritardo', 'Guasto', 'Cancellazione') 
GROUP BY t.ID_Tratta, t.NomeTratta, t.TipoServizio
ORDER BY NumeroProblemiRegistrati DESC;

/*10.	Fornito uno specifico evento “viaggio”, mostrare quanti posti sono liberi per la tratta 
specifica da una stazione di salita e quella di discesa, considerando che altri passeggeri possono occupare il posto per un segmento diverso.*/

SELECT v.ID_Viaggio,  m.CapacitaMax AS PostiTotali,
    ( SELECT COUNT(b.ID_Biglietto) FROM BIGLIETTO AS b WHERE b.ID_Viaggio = v.ID_Viaggio
    ) AS PostiOccupati,

    m.CapacitaMax - (SELECT COUNT(b.ID_Biglietto) FROM BIGLIETTO AS b WHERE b.ID_Viaggio = v.ID_Viaggio
    ) AS PostiDisponibili
FROM VIAGGIO AS v
JOIN MEZZO m ON v.ID_Mezzo = m.ID_Mezzo
WHERE v.ID_Viaggio = 9; 

