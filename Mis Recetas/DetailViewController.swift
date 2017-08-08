//
//  DetailViewController.swift
//  Mis Recetas
//
//  Created by Luisa Fernanda Arango Valencia on 8/08/17.
//  Copyright © 2017 Luisa Fernanda Arango Valencia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    var recipe : Recipe!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ratinButton: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // estas dos lineras se usan para que las lineas de la tabla sean dinamicas, y puede caber todo el texto
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

        //el titulo en la barra superiro header
        self.title = recipe.name
        
        self.recipeImageView.image =  self.recipe.image
        self.labelTitle.text =  self.recipe.name
        self.tableView.tableFooterView = UIView(frame : CGRect.zero) //Esto es para que desaparescan las celdas vacias
        
        let image =  UIImage(named : self.recipe.rating)
        self.ratinButton.setImage(image, for: .normal)
       // self.labelIngredintes.text = self.recipe.ingredients
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * perimite que no se oculte la barra superiro, porque sin el header bar no se puede dar BACK
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe =  false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    */
    /*
     * Se hace para cerrr el modal
     */
    @IBAction func close(segue: UIStoryboardSegue){
        if let reivewVC =  segue.source as? ReviewViewController{
            if let rating = reivewVC.reitingSelecter
            {   self.recipe.rating = rating
                let image =  UIImage(named : self.recipe.rating)
                self.ratinButton.setImage(image, for: .normal)
                
            }
        }
    }
   
}


extension DetailViewController : UITableViewDataSource {
    
    /*
     * Indicar cuantas secciones tiene la tabla
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    /*
     * Cuantos numeros contiene una seccion (Numero total de filas en la seccion)
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
             return self.recipe.ingredients.count
        case 1:
             return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    /*
     * indexPath = sabe en cual fila y columna se encuentra situado
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for : indexPath) as! RecipeDetailViewCell
        switch indexPath.section {
        case 0:
             cell.valorLabel.text =  self.recipe.ingredients[indexPath.row]
        case 1:
             cell.valorLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
      
        
        return cell
    }
    
    /*
     * funcion que se implementa para ponerle el tittlo a la seccion
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 0:
            title = "Ingredientes"
        case 1 :
            title = "Pasos"
        default:
            break
        }
        
        return title
    }
    
}

