library(jsonlite)

# Faire venir les données avec fromJSON ==> 1ère manière 
data <- fromJSON("https://geo.api.gouv.fr/communes?codePostal=35200&fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre")

# Construire une fonction qui appelle l'API ==> 2ème manière
get_by_code <- function(query){
  url <- paste("https://geo.api.gouv.fr/communes?codePostal=",query, "&fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre", sep = "")
  result <- fromJSON(url)
  return(result)
}
get_by_code("35200") #==>appelle la fonction

## Par étape
query <- "35200"
url <- paste("https://geo.api.gouv.fr/communes?codePostal=",query, "&fields=nom,code,codesPostaux,codeDepartement,codeRegion,population&format=json&geometry=centre", sep = "")

# Appel de l'url avec GET
response <- httr::GET(url)
response

# Récupération du contenu
response2 <- response$content
response2

# Transformation en contenu lisible
response3 <- rawToChar(response2)
response3

# Depuis JSON
response4 <- fromJSON(response3)
response4

# TP Djamila --------------------------------------------------------------
#Continuer le Tp
#A partir de geoapi, esssayer de faire un code qui nous permet d'avoir la liste des noms et code de l'ensemble des regions.

infos_toutes_les_regions <- function(query){
  url <- paste("https://geo.api.gouv.fr/regions?fields=nom,code&format=json")
  result <- fromJSON(url)
  return(result)
}

toutes_regions <- infos_toutes_les_regions()


Mes_documents <- "C:/Users/jamil/Documents/Cours/Cours M2/S2/SQL/GitHub/"

if (!file.exists(Mes_documents)) {
  dir.create(Mes_documents)
}

TP1 <- paste0(Mes_documents, "Devoirs_API_Djamila_Dataset_Toutes_les_regions.csv")

write.csv(toutes_regions, file = TP1, row.names = FALSE)

#Créer le projet api_r (format CSV + script R) sur votre compte git
#Envoyer le projet local sur votre compte git 
#M'inviter sur votre projet( mail: senemameastou@gmail.com)
#Envoyer un mail une fois que vous avez terminé.



