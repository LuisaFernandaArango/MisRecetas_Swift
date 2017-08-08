//
//  ViewController.swift
//  Mis Recetas
//
//  Created by Luisa Fernanda Arango Valencia on 3/08/17.
//  Copyright © 2017 Luisa Fernanda Arango Valencia. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipies : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       var recipe = Recipe (
            name : "Tortilla de papas",
            image : #imageLiteral(resourceName: "tortilla") ,
            time :  20 ,
            ingredients: ["Papas", "Huevos", "Cebolla"],
            steps : ["Pelar las papas y la cebolla", "Cortar las papas y la cebolla, poner a sofreir ", "Batir los huevos y echarlos durante 1 minuto al sarten en co elresto de ingredientes"])
        recipies.append(recipe)
        
        recipe = Recipe (
            name : "Pizza margarita",
            image : #imageLiteral(resourceName: "pizza"),
            time: 60,
            ingredients: ["Harina", "Levadura", "Aceite", "Sal", "Tomate", "Queso"],
            steps:["Hacer la masa con harina, levadura, aceite y sal",
                   "Dejar reposar la maso 30 minutos",
                   "Extendemos la masa encima de una bandeja y añadimos el resto de los ingredientes",
                   "Hornear durante 12 minutos"])
        recipies.append(recipe)
        
        recipe = Recipe (
            name : "Hamburgesa",
            image: #imageLiteral(resourceName: "hamburgesa"),
            time: 10,
            ingredients: ["Pan de hamburguesa", "Lechuga", "Tomate", "Cebolla", "Carne", "Queso"],
            steps:["Poner al fuego la carne al gusto ",
                   "Montar la hamburguesa con sus ingredientes entre los panes"])
        recipies.append(recipe)
        
        recipe = Recipe (
            name : "Rollitos",
            image : #imageLiteral(resourceName: "queso"),
            time: 10,
            ingredients: ["Lorem ipsum dolor sit amet","Tomate", "Cebolla", "Carne", "Queso"],
            steps:["Lorem ipsum dolor sit amet ",
                   "Montar  con sus ingredientes entre los panes"])
        recipies.append(recipe)
        
        recipe = Recipe (
            name : "Arepa",
            image : #imageLiteral(resourceName: "arepa"),
            time: 15,
            ingredients: ["Harina", "queso"],
            steps:["Hacer la masa con harina, levadura, aceite y sal",
                   "Dejar reposar la maso 30 minutos",
                   "Extendemos la masa encima de una bandeja y añadimos el resto de los ingredientes",
                   "Hornear durante 12 minutos"])
        recipies.append(recipe)
        
        recipe = Recipe (
            name : "Ensalasa",
            image : #imageLiteral(resourceName: "ensalada"),
            time: 10,
            ingredients: ["Verdura"],
            steps:["Hacer la masa con harina, levadura, aceite y sal",
                   "Dejar reposar la maso 30 minutos",
                   "Extendemos la masa encima de una bandeja y añadimos el resto de los ingredientes",
                   "Hornear durante 12 minutos"])
        recipies.append(recipe)
        
        recipe = Recipe (
            name : "HotDog",
            image : #imageLiteral(resourceName: "hot-dog"),
            time: 15,
            ingredients: ["Harina", "Aceite", "Sal", "Tomate", "Queso"],
            steps:["Hacer la masa con harina, levadura, aceite y sal",
                   "Dejar reposar la maso 30 minutos",
                   "Extendemos la masa encima de una bandeja y añadimos el resto de los ingredientes",
                   "Hornear durante 12 minutos"])
        recipies.append(recipe)
        
        recipe = Recipe (
            name : "Postre",
            image : #imageLiteral(resourceName: "postre"),
            time: 40,
            ingredients: ["Aceite", "Sal", "Tomate", "Queso"],
            steps:["Hacer la masa con harina, levadura, aceite y sal",
                   "Dejar reposar la maso 30 minutos",
                   "Extendemos la masa encima de una bandeja y añadimos el resto de los ingredientes",
                   "Hornear durante 12 minutos"])
        recipies.append(recipe)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     * Se ouclta el header bar, cuando se da scroll hacia abajo
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe =  true
    }
    /*
     * Para desparecer a barra superior de notificaciones
     */
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    
    // MARK: - UITableViewDatasource
    /*
     * Indicar cuantas secciones tiene la tabla
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /*
     * Cuantos numeros contiene una seccion (Numero total de filas en la seccion)
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipies.count
    }
    
    /*
     * indexPath = sabe en cual fila y columna se encuentra situado
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipies[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellID, for : indexPath) as! RecipeCell
        cell.ImageSmallview.image =  recipe.image
        cell.nameLabel.text  =  recipe.name
        cell.timeLabel.text =  "\(recipe.time!) min"
        cell.ingredientsLabel.text =  "Cantidad de ingredientes : \(recipe.ingredients.count)"
        
        
        /*Condicion para marcar el check como fav
        if recipe.isFavorite {
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }*/
        cell.accessoryType = .none
        
        //estilo para poner la imagen en circulo
        cell.ImageSmallview.layer.cornerRadius = 42.0
        cell.ImageSmallview.clipsToBounds = true
        return cell
    }
    /*
     * funcion que habilita el deslizar para eliminar
     */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //si se desliza y despues le dan click en el bton elimnar, removemos la receta de la lista
        if editingStyle == .delete{
            
            self.recipies.remove(at: indexPath.row)
            //self.tableView.reloadData() //para refrescar TODA la tabla
            self.tableView.deleteRows(at: [indexPath], with: .fade)//refresca de manera mas optima, solo refrezca el elemento de la lista.. ya que si tenemos mil valores no es optimo refrezcar mil valores
        }
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Accion de compartir
        let compartirAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let compartirDefaultText =  "Estoy mirando la receta de \(self.recipies[indexPath.row].name!) en la App de las recetas creada por lu_aragonva"
            let activityController = UIActivityViewController(activityItems: [compartirDefaultText, self.recipies[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        // se personaliza el color del boton compartir
        compartirAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0,  alpha: 1.0)
        
        //Accion de borrar 
        let deleteAction = UITableViewRowAction(style: .default, title: "Eliminar") { (action, indexPath) in
            self.recipies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        // se personaliza el color del boton eliminar
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [compartirAction, deleteAction]
    }
    //MARK : -UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Se marca como favorito
      /*  let recipe =  self.recipies[indexPath.row]
        
        let alertControler =  UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        
        let cancelAction =  UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertControler.addAction(cancelAction)
        
        var favTitle = "Favorito"
        var favStyle = UIAlertActionStyle.default
        
        if recipe.isFavorite{
            favTitle = "No favorito"
            favStyle = UIAlertActionStyle.destructive
        }
        
        let favAction = UIAlertAction(title: favTitle, style: favStyle){ (action) in
            let recipe = self.recipies[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData() //para refrescar la tabla
        }
        alertControler.addAction(favAction)
        
        self.present(alertControler, animated: true, completion: nil)*/
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{            
            if let indexPath =  self.tableView.indexPathForSelectedRow {
                let selectedRecipe =  self.recipies[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
            
        }
    }
  
}

