library(data.table)

#set working directory
setwd('/Users/analutzky/Desktop/UMR_CNRS/dep5_6_par_regroupement/dep6_tutelles_et_multisites')

Table_UMR=fread('/Users/analutzky/Desktop/UMR_CNRS/dep5_6_par_regroupement/dep6_tutelles_et_multisites/etab_tutelles_in_sites_dedoublonnee.csv')

View(Table_UMR)
# -> affichage excel-like

var.names=colnames(Table_UMR)
colnames(Table_UMR)=make.names(var.names)

# Compter le nombre d'occurrences uniques d'intitulés d'UMR sur le site de Lyon
Table_UMR[Site..nom.court.=='Lyon',length(unique(Intitulé.2018))]
# [1] 64
# Compter le nombre d'occurrences uniques de codes unité d'UMR sur le site de Lyon
Table_UMR[Site..nom.court.=='Lyon',length(unique(Code.Unité.au.31.12.2018))]
# [1] 65
# => y'a un souci. Une même UMR a deux codes unité différents. ouch.

# Faire la liste des codes UMR - nom d'UMR (elevant les duplicats de la paire) : en gros on dédoublonne 
x=unique(Table_UMR[Site..nom.court.=='Lyon',.(Code.Unité.au.31.12.2018,Intitulé.2018)],by=c('Code.Unité.au.31.12.2018','Intitulé.2018'))

# NB : ici la syntaxe c'est du R de base, c'est pas du data.table, car unique c'est du R de base (qui s'applique ici à une table au format data.table). 
# D'où le c() pour concaténer après le by, et le fait qu'on utilise des guillements pour le nom des variables.
# Unique, par défaut, il ne garde que les lignes uniques d'un jeu de données. 
# Si on fait un unique(dt[,.(a,b)],by=c("a","b")), il ne garde que la 1ère ligne pour chaque valeur identique du couple de variables a et b. 
# Il supprime les autres lignes où les valeurs de ce couple de variables sont dupliquées.


# Eventuellement dans l'ordre alphabétique des noms d'UMR
x[order(Intitulé.2018),]
# Débusquer le duplicat (la fonction duplicated donne seulement le 2e, ou toutes les occurrences après le 1er)
x[duplicated(Intitulé.2018),]
#    Code.Unité.au.31.12.2018                                   Intitulé.2018
# 1:                  UMR5304 Institut des sciences cognitives Marc Jeannerod
# Et voilààààà