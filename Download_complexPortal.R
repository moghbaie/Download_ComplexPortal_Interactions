# Mehrnoosh Oghbaie
# 10/05/2018
# reading files in ftp server and converting interaction data to table


## setting working directory
setwd(
  paste0(dirname(rstudioapi::getActiveDocumentContext()$path))
)

source("Functions.R")
CRAN.packages <- c("XML","RCurl","xml2","httr")
bioconductor.packages <- c()
source("Functions/Functions.R")
install.packages.if.necessary(CRAN.packages,bioconductor.packages)


#################################################################################
## homo_sapiens 
## setting the url

url <- "ftp://ftp.ebi.ac.uk/pub/databases/intact/complex/current/psi25/Homo_sapiens/"

## getting list of files on ftp folder
filenames <- getURL(url, ftp.use.epsv = FALSE,dirlistonly = TRUE) 
filenames = paste(url, strsplit(filenames, "\r*\n")[[1]], sep = "")

## making empty dataframe to save the total interaction data from each species
Total_list_homosapien <- data.frame(matrix(ncol=5,nrow=0))
colnames(Total_list_homosapien) <- c("id_A", "id_B", "protein_A", "protein_B", "complex")


for(i in 1:length(filenames)){
  file <- filenames[i]
  dir <- "F:/Network_Analysis//ComplexPortal/homosapien/"
  list <- Convert2CSV(file,dir)
  Total_list_homosapien <- rbind(Total_list_homosapien,list)
}

write.csv(Total_list_homosapien ,"Total_list_homosapien.csv")

#################################################################################
## Saccharaomyces Cerevisiae
## setting the url

url <- "ftp://ftp.ebi.ac.uk/pub/databases/intact/complex/current/psi25/Saccharomyces_cerevisiae/"

## getting list of files on ftp folder
filenames <- getURL(url, ftp.use.epsv = FALSE,dirlistonly = TRUE) 
filenames = paste(url, strsplit(filenames, "\r*\n")[[1]], sep = "")

## making empty dataframe to save the total interaction data from each species
Total_list_saccharomyces_cerevisiae <- data.frame(matrix(ncol=5,nrow=0))
colnames(Total_list_saccharomyces_cerevisiae) <- c("id_A", "id_B", "protein_A", "protein_B", "complex")


for(i in 1:length(filenames)){
  file <- filenames[i]
  dir <- "F:/Network_Analysis/ComplexPortal/saccharomyces_cerevisiae/"
  list <- Convert2CSV(file,dir)
  Total_list_saccharomyces_cerevisiae <- rbind(Total_list_saccharomyces_cerevisiae,list)
}

write.csv(Total_list_saccharomyces_cerevisiae ,"Total_list_saccharomyces_cerevisiae.csv")

#################################################################################
## Mus_musculus
## setting the url

url <- "ftp://ftp.ebi.ac.uk/pub/databases/intact/complex/current/psi25/Mus_musculus/"

## getting list of files on ftp folder
filenames <- getURL(url, ftp.use.epsv = FALSE,dirlistonly = TRUE) 
filenames = paste(url, strsplit(filenames, "\r*\n")[[1]], sep = "")

## making empty dataframe to save the total interaction data from each species
Total_list_mus_musculus <- data.frame(matrix(ncol=5,nrow=0))
colnames(Total_list_mus_musculus) <- c("id_A", "id_B", "protein_A", "protein_B", "complex")


for(i in 1:length(filenames)){
  file <- filenames[i]
  dir <- "F:/Network_Analysis/ComplexPortal/mus_musculus/"
  list <- Convert2CSV(file,dir)
  Total_list_mus_musculus <- rbind(Total_list_mus_musculus,list)
}

write.csv(Total_list_mus_musculus ,"Total_list_mus_musculus.csv")


