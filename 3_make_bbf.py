import os

# Définir le chemin du répertoire contenant les fichiers
directory = "/media/stagiaireNFS3/henes/gwas_2/post_imputation"

# Parcourir tous les fichiers du dossier
for filename in os.listdir(directory):
    # Vérifier si le fichier correspond au motif "filtered.vcf.gz"
    if filename.endswith("filtered.vcf.gz"):
        # Construire le chemin complet du fichier
        filepath = os.path.join(directory, filename)
        
        # Extraire le nom de base du fichier sans extension
        filename_no_extension = os.path.splitext(filename)[0]
        
        # Exécuter la commande plink sur chaque fichier
        os.system(f"plink --gzvcf {filepath} --make-bed --out {os.path.join(directory, filename_no_extension)}")

