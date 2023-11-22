# Modello degli eventi
 Evento: risposta ad una azione che accade durante l’esecuzione di una applicazione 
 
 Eventi del mouse, della tastiera, dell’interfaccia utente, di finestre
  - individuare gli eventi a cui si è interessati ed il sensore di eventi (Adapter (classe) o Listener (interfaccia) ) associato 

  >il listener fa da sensore per determinate azioni.
  >Lo uso o estendendo ad una classe adapter oppure implemento 
  >interfaccia di tipo listener, qui si definiscono i medoti di risposta all'input  
  
  - creare il codice per il sensore: definisco il sensore come classe separata o definisco il mio contenitore come sensore? (in questo caso userò una interfaccia))
  - registrare il sensore nel JPanel (o in generale sul componente che il sensore deve monitorare) 
  
  Eventi mouse: 
	  sensore MouseMotionListener (MouseMotionAdapter) 
	  evento metodi mouse mosso public void mouseMoved(MouseEvent e) 
	  mouse drag public void mouseDragged(MouseEvent e) 

>O estendo a mousemotionadapter oppure implemento mousemotionlistener
>mouse drag è il movimento il uno dei tasti premuto
>
>ATTENZIONE
>a dove è registrato il sensore, è importante specificare dove deve guardare 
  
  sensore MouseListener (MouseAdapter) 
	  evento metodi 
	  mouse giù public void mousePressed(MouseEvent e) 
	  mouse su public void mouseReleased(MouseEvent e) 
	  mouse clicca public void mouseClicked(MouseEvent e) 
	  mouse entra public void mouseEntered(MouseEvent e) 
	  mouse esce public void mouseExited(MouseEvent e)

****

#contro INTERFACCIA
Se implemento un interfaccia devo implementari tutti i metodi anche quelli che non mi servono(quelli che non mi servono li implemento che non fanno nulla)
#pro
posso interagire direttamente con le componenti da gestire 
e posso gestire con più tipi di eventi

CLASSE(uso Adapter)
#pro CLASSE
eredito implementati (che non fanno nulla) e reimplemento solo quelli che mi servono
#contro
devo passa al sensore un riferimento perchè possa interagire con i componenti da gestire
il sensore gestisce solo un tipo di eventi

Domande esame

>differenza tra classi e interfacce
>un interfaccia contiene solo metodi astratti, statici e costanti
>una classe contiene campi e metodi implementati
>Per evitare problemi di sicurezza si fa questa distinzione

>perche in java esistono le interfacce?
>perchè in java c'è l'ereditarietà singola
>quindi si può estendere ad una sola classe 
>e si possono implementare più interfacce