
options(stringsAsFactors=FALSE)
#Input and Read the File 
file1 <- file.choose()
file1_read<- read.table(file1, header=TRUE, sep = "\t")
newtable <- data.frame(Raw.file = file1_read$Raw.file, Mass = file1_read$Mass, Time = file1_read$Retention.time, Width = file1_read$Retention.Length, Intensity = file1_read$Intensity)
mass1<- newtable[order(newtable$Raw.file,newtable$Mass),]
savename <- sapply(strsplit(file1,"\\."), `[`, 1)
write.table(mass1, paste(savename,"-reduced.csv",sep="") , sep=",", row.names=FALSE, col.names=TRUE)