library(readxl)
library(dplyr)
df<-read_xlsx('online_retail_II.xlsx')
str(df)
summary(df)
#Calcula cuántos pedidos distintos hay en el fichero
hola<-df%>%
  distinct(Invoice)%>%
  count()
#Calcula el precio medio de producto por pedido
consulta2<-df%>%
  group_by(Invoice)%>%
  summarise(total_prod=sum(Quantity), total_prec=sum(Price))
consulta2$media<-(consulta2$total_prec/consulta2$total_prod)
#12.	Calcula el número de productos por pedido
consulta3<-df%>%
  group_by(Invoice)%>%
  summarise(total_prod=sum(Quantity))
#13.	Calcula el precio por pedido
consulta4<-df%>%
  group_by(Invoice)%>%
  summarise(total_prec=sum(Price))

