//
//  ViewController.swift
//  Acochadinho
//
//  Created by Rogerio Fabricio on 01/08/17.
//  Copyright © 2017 Rogerio Fabricio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var certo: UITextField!
    @IBOutlet weak var escolhido: UITextField!
    
    var menorNum = 0
    var maiorNum = 100
    var numEscolhido = 0
    var numCerto = 0
    var numTeste1 = 0
    var numTeste2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        escolhido.isHidden = true
        lb2.isHidden = true
        
    }
    

    @IBAction func btnSalvarNum(_ sender: Any) {
        
        if ( certo.text == "" ) {
            lb1.text = "Você não pode deixar o campo vazio!!! Digite um número entre 1 e 100"
        } else {
            lb1.text = "Escolha um número entre 1 e 100:"
            numCerto = Int(certo.text!)!
            certo.isHidden = true
            escolhido.isHidden = false
        }
        
    }
    
    @IBAction func btnVerificar(_ sender: Any) {
        
        lb1.isHidden = true
        lb2.isHidden = false
        
        if ( escolhido.text == "" ) {
            lb2.text = "Você não pode deixar o campo vazio!!!" + "Escolha um número entre " + String(menorNum) + " e " + String(maiorNum) + ":"
        } else {
            verificacao()
            escolhido.text?.removeAll()
        }
        
    }
    
    
    @IBAction func btnReiniciar(_ sender: Any) {
        
        certo.isHidden = false
        certo.text?.removeAll()
        escolhido.text?.removeAll()
        escolhido.isHidden = true
        lb2.isHidden = true
        lb1.isHidden = false
        lb1.text = "Escolha um número entre 1 e 100:"
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func verificacao() {
        
        numEscolhido = Int(escolhido.text!)!
        
        if ( numEscolhido == numCerto ) {
            
            certo.isHidden = true
            lb2.text = "Você Acertou o Número " + String(numCerto)
            
        } else {
            
            
            if ( numEscolhido > numCerto ) {
                
                maiorNum = numEscolhido
                
                numTeste1 = menorNum + 1
                numTeste2 = maiorNum - 1
                
                if ( numCerto == numTeste1 && numCerto == numTeste2) {
                    
                    lb2.text = "Você Foi Imprensado " + String(numCerto)
                    
                }
                
            } else {
                
                menorNum = numEscolhido
                
                numTeste1 = menorNum + 1
                numTeste2 = maiorNum - 1
                
                if ( numCerto == numTeste1 && numCerto == numTeste2) {
                    
                    lb2.text = "Você Foi Imprensado " + String(numCerto)
                    
                }
                
            }
            
            lb2.text = "Escolha um número entre " + String(menorNum) + " e " + String(maiorNum) + ":"
            
        }
        
    }

}

