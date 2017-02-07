library("rpart")
library("rpart.plot")

#Construcao de arvore de decisao com classe NOMINAL para CLASSIFICAO
#Base de dados: IRIS, 4 atributos: petal_length, petal_width, sepal_legth, sepal_width (reais)
#                     Classes: Iris-virginica, Iris-versicolor, Iris-setosa (nominal)

#=================TREINAMENTO===============================

#Leitura de dados IRIS
dados_treina <- read.table('iris_treina.dat',header=TRUE,sep=",")

#Criacao do modelo de ARVORE DECISAO
arvore <- rpart(classe ~ sepal_length +  sepal_width + petal_length +  petal_width, data = dados_treina, method = "class", control = rpart.control(minsplit = 1), parms = list(split = "Information"))

#PLOTA arvore criada
plot_arvore <- rpart.plot(arvore, type=3)

#=================TESTE====================================
#Leitura de dados IRIS
dados_teste <- read.table('iris_teste.dat',header=TRUE,sep=",")

#Classificando 37 instancias de treinamento
teste <- predict(arvore,dados_teste,type="class")


#Resultado da classifacao
write.csv(teste,file="result_teste_iris.csv")





