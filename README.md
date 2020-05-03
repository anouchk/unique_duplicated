# Chercher un duplicat dans une botte de foin

Lors de mon travail sur les UMR CNRS, une unité m'avait donné du fil à retordre : l'Institut des sciences cognitives Marc Jeannerod, car il apparaissait sous ce nom tout en répondant à deux codes unités distincts :
- Neurosciences Cognitives - UMR 5229
- Langage Cerveau et Cognition - UMR5304 

Du coup je me retrouvais avec 64 intitulés de labo mais 65 codes unité ;-(

Pour débusquer le duplicat :
- J'ai d'abord utilisé la fonction **unique()**, pour associer les 65 couples uniques de nom de labo et de code unité. Cette fonction ne garde que les lignes uniques.
- Puis avec **duplicate()**, j'ai regardé quel nom de labo était répliqué 2 fois. Cette fonction ne sort que les valeurs dupliquées.
