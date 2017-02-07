library("rpart")
library("rpart.plot")

#Construcao de arvore de REGRESSAO com classe CONTINUA
# DataSet: FORESTFIRE atributos: X, Y => int mont, day => nominal FFMC,DMC,DC,ISI,temp => real, RH => int, wind => real, rain,area => real
#                     atributo CLASSE escolhido : temp 
#=================TREINAMENTO===============================

#Leitura de dados FORESTFIRE
dados_treina <- read.table('forestfires_treina.dat',header=TRUE,sep=",")

#Criacao do modelo de ARVORE REGRESSAO
arvore <- rpart(temp ~ X + Y + month + day + FFMC + DMC + DC + ISI + RH + wind + rain + area, data = dados_treina, method = "anova",parms = list(split = "Information"))


#PLOTA arvore criada
plot_arvore <- rpart.plot(arvore, type=3)

#=================TESTE====================================
#Leitura de dados FORESTFIRE
dados_teste <- read.table('forestfires_teste.dat',header=TRUE,sep=",")

#Classificando 129 instancias de treinamento
teste <- predict(arvore,dados_teste,type="vector")

#Resultado da classifacao
write.csv(teste,file="result_teste_fire.csv")

