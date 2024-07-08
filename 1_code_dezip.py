import os 

os.chdir("/media/stagiaireNFS3/henes/gwas_2/post_imputation")

list_zfile = os.listdir("/media/stagiaireNFS3/henes/gwas_2/post_imputation")

for file in list_zfile: 
    if ".zip" in file : 
        os.system(f"unzip -PNSwcT_jn819WVh {file} -d .") 
