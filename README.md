# R-investigazione-statistica-prezzi-fornitori
Analisi statistica prezzi fornitori e simulazione stocastica con t-test e p-value in R

Molto spesso nella pratica di scelta o di scambio tra due fornitori siamo chiamati a prendere delle decisioni in base al prezzo di vendita della merce e altri fattori. Tali decisioni spesso vengono prese in base a semplici confronti di convenienza economica, basate sull'ultima e/o penultima quotazione ricevuta. Questa pratica può condurci in un errore di valutazione. Un attenta analisi dei dati può aiutarci a prendere le giuste decisioni e creare valore aggiunto. Se c'è una vera differenza tra i due magari possiamo scelgiere il fornitore veramente più conveniente, se invece non c'è differenza potremmo scegliere in base ad altri fattori.

In questo caso si vuole investigare, su base di dati campionari e di ampiezza ridotta (N<30), l'andamento dei prezzi di vendita della lamiera in alluminio tra due fornitori e determinare se tali variazioni di prezzo siano indipendenti dal tipo di fornitore, nonché correlati esclusivamente alle oscillazioni del valore di mercato della materia prima e che non vi è dunque una sostanziale differenza di scelta economica tra i due. Considerando che le variazioni del valore di mercato della materia prima sono le stesse per entrambi, possiamo affermare che: a parità di qualità di produzione tra i due fornitori, per dimostrare l'ipotesi di indipendenza, basterà determinare che la differenza della media dei prezzi non è statisticamente significativa.

Utilizzeremo un test di ipotesi e di significatività per piccoli campioni (t-test). Nel test, si è deciso di utilizzare un livello di significatività dello 0,05 (cioè del 5%), che rappresenta la probabilità massima con cui accettiamo di sbagliare rifiutando l'ipotesi descritta quando invece avrebbe dovuto essere accettata. In altre parole il 5% di probabilità massima di essere in errore accettando l'eventuale ipotesi alternativa: che i prezzi di vendita sono dipendenti dal tipo di fornitore e che quindi la differenza della media delle osservazioni è significativa.

Da un analisi di due fornitori presi in esame si è prodotto il seguente file:

vanAllC.csv

Il file è di tipo csv con virgola come metodo di separazione e raccoglie l'andamento dei prezzi al kg (con "." come separatore decimale e arrotondamento a una cifra) riferiti alla lamiera di alluminio grezza da 1mm di spessore. I dati sono stati raccolti durante gli ultimi due anni e non sono noti rifierimenti temporali delle osservazioni, ma è accertata l'univocità dei rilevamenti, ordinati dal più datato a quello più recente, suddivisi per fornitore e incolonnati.

