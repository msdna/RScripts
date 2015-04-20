
options(stringsAsFactors=FALSE)
#Input and Read the File 
file1 <- file.choose()
file1_read<- read.table(file1, header=TRUE, sep = "\t")


print("Enter the mass")
Mass <- scan()
print("Enter the time")
Time <- scan()
#What is 20ppm of mass?
ppm20 <- Mass*(20*0.000001)
Masslow <- Mass-ppm20
Masshigh <- Mass+ppm20

time1 <- subset(file1_read,file1_read$Retention.time <= Time+4 & file1_read$Retention.time >= Time-4)
mass1 <- subset(time1,time1$Mass <= Masshigh & time1$Mass >= Masslow)
savename <- sapply(strsplit(file1,"\\."), `[`, 1)
write.table(mass1, paste(savename,"-1283.621_31.2.csv") , sep=",", row.names=TRUE, col.names=TRUE)