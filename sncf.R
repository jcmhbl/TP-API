
# Documentations ----------------------------------------------------------

#documentation https://doc.navitia.io/#getting-started
#documentation https://ressources.data.sncf.com/pages/accueil/
#documentation https://doc.navitia.io/#getting-started


# Code R ------------------------------------------------------------------

#install.packages("jsonlite")
library("jsonlite")
#install.packages("tidyverse")
library("tidyverse")
#install.packages("lubridate")
library("lubridate")
#quelle requete pour obtenir la liste des trains arrivées en strasbourg
json_arrivees <- fromJSON("https://47ae12f4-4d93-456a-b7ed-f042d38d3933@api.sncf.com/v1/coverage/sncf/stop_areas/stop_area:SNCF:87212027/arrivals?count=1000&")

#Décorticage de lien :
#json_arrivees <- fromJSON
#("https://47ae12f4-4d93-456a-b7ed-f042d38d3933@api ==> 
#.sncf.com/v1/coverage/sncf/ ==> 
#stop_areas/stop_area:SNCF:
#87212027/==> code pour strasbourg
#arrivals
#?count=1000&") ==> pb de lenteur si plus de 1000 --> limite

View(json_arrivees)
# Transformation des données en tableau
arriv_infos <- as.data.frame(as.list(json_arrivees$arrivals)$display_informations)
# Séléction des variables utiles et création d'un identifiant pour jointure
infos <- arriv_infos %>% select(Reseau = network, Type = physical_mode, Direction = direction, Ligne = name, Num = trip_short_name) %>% mutate(id =
                                                                                                                                                 rownames(arriv_infos))
# Transformation des données en tableau
arriv_hor <- as.data.frame(as.list(json_arrivees$arrivals)$stop_date_time)
# Séléction des variables utiles 
horaire <- arriv_hor %>% select(Arrivee = arrival_date_time) %>% mutate(id = rownames(arriv_hor))

# Ecriture du CSV
Mes_documents <- "C:/Users/jamil/Documents/Cours/Cours M2/S2/SQL/GitHub/"

if (!file.exists(Mes_documents)) {
  dir.create(Mes_documents)
}

TP1 <- paste0(Mes_documents, "arrivees_Strasbourg.csv")

write.csv(horaire, file = TP1, row.names = FALSE)
Exercice

# Exercice ----------------------------------------------------------------

#1-créer une branche sur votre tp_api nommée api_sncf

#2-Ajouter le fichier que je vous ai envoyé

#3-Tester les trois urls renvoyaient avec la création de votre token

#4-En 2022,Construiser moi une base contenant l'ensemble des trains qui ont visité 100 gares différents
#5- Merger votre travaux à votre branche initial
#6-Envoyer votre travaux sur git
#7 Envoyer un mail avec le lien de votre compte git
