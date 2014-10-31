//
//  ViewController.swift
//  AnniCane
//
//  Created by Mac-Diego on 31/10/14.
//  Copyright (c) 2014 Mac-Diego. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Dichiaro la label dove appaiono gli anni in uomo, calcolati da un inserimento dell'età del cane.
    @IBOutlet var lblanniUomo: UILabel!
    
    //La text dove vengono inseriti gli anni del cane
    @IBOutlet var txtanniCane: UITextField!
    
    //Dichiaro la View dedicata per visualizzare l'immagine
    @IBOutlet var viewimgCane: UIImageView!
    
    //Dichiaro uno switch che in base alla posizione On/Off visualizza o meno l'immagine
    @IBOutlet var switchOnOff: UISwitch!
    
    //Dichiaro la label On e Off che userò per visualizzare il testo On/Off nel momento che muovo lo switch
    @IBOutlet var lblstatoOn: UILabel!
    @IBOutlet var lblstatoOff: UILabel!
    
    //Funzione che calcola gli anni umani
    @IBAction func calcolaAnni(sender: AnyObject) {
        
        //Assegno alla variabile cane il valore scritto nella text, ma essendo una stringa, bisona convertire in valore intero per il calcolo.
        var cane = (txtanniCane.text as NSString).integerValue
        var anniUomo = 0
        
        
        
        //Eseguo una serie di IF per calcolare gli anni del cane in anni umani.
        
        //Se viene inserito 0 anni o non viene inserito niente allora rimane 0.
        if cane == 0 {
            anniUomo = 0
            //Nel caso del primo anno per un valore di 10 allora avrà 10 anni.
        } else if cane == 1 {
            anniUomo = 10
            //Nel caso del secondo anno per un valore di 15 allora avrà 25 anni (primo anno = 10 + secondo anno = 15)
        } else if cane == 2 {
            anniUomo = 25
            //Nel caso dal terzo anno in poi per un valore di 3 per ogni anno, tolgo 2 anni riferiti al primo e secondo anno (di cui il valore è 25) e moltiplico per 3 i restanti anni per poi sommare il valore del primo e secondo anno.
        } else {
            anniUomo = (cane - 2) * 3 + 25
        }
        
        //Visualizzo nella label il risultato di quanti anni umani avrà il cane.
        lblanniUomo.text = "\(anniUomo)"
        
        //Assegno la foto alle rispettive costanti, 3 diverse foto per 3 categorie di età.
        let caneVecchio = UIImage(named: "canevecchio.jpg")
        let caneGiovane = UIImage(named: "canegiovane.jpg")
        let caneMaturo = UIImage(named: "canematuro.png")
        
        //Assegno alla variabile stato il controllo switch.
        var stato = switchOnOff
        
        //Nel caso in cui lo stato dello switch è su ON allora faccio vedere la foto del cane, variando in base all'età inserita. Anche in questo caso eseguo una serie di IF per verificare quale foto visualizzare
        if stato.on {
            //Se il cane ha 1-2-3 anni escludendo 0 anni allora visualizzo l'immagine di un cane giovane.
            if cane != 0 && cane <= 3 {
                viewimgCane.image = caneGiovane
                //Se il cane ha 4-5-6-7 allora visualizzo l'immagine di un cane maturo.
            } else if cane > 3 && cane <= 7 {
                viewimgCane.image = caneMaturo
                //Se il cane ha piu di 7 anni allora visualizzo l'immagine di un cane vecchio
            } else if cane > 7 {
                viewimgCane.image = caneVecchio
            }
            //Se il cane ha 0 anni (errore di inserimento che può capitare) allora non visualizzo alcuna immagine.
        } else if cane == 0 {
            viewimgCane.image = nil
            //Se lo stato dello switch è su OFF allora non visualizzo sempre nessuna immagine.
        } else {
            viewimgCane.image = nil
        }
        
    }
    
    
    //Nella funzione dichiaro una variabile stato che prende il valore dello switch (On/Off) e nel caso in cui sia ON/OFF nascondo le rispettive label per far apparire la label giusta.
    @IBAction func imgOnOff(sender: AnyObject) {
        
        //Assegno alla variabile stato il controllo switch.
        var stato = switchOnOff
        
        //Se lo switch è su ON allora rendo visibile la mia label ON e nascondo OFF
        if stato.on {
            calcolaAnni(viewimgCane)
            lblstatoOn.hidden = false
            lblstatoOff.hidden = true
            //Se lo switch è su OFF allora rendo visibile la mia label OFF e nascondo ON e disattivo la visualizzazione delle immagini
        } else {
            lblstatoOn.hidden = true
            lblstatoOff.hidden = false
            viewimgCane.image = nil
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //In Fase di caricamento avrò lo switch impostato su ON e quindi nascondo la label OFF.
        lblstatoOff.hidden = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

