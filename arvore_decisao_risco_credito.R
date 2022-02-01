base = read.csv('risco_credito.csv')

#install.packages('rpart')
library(rpart)

# para criar arvore de deciao com poucas informações (control = rpart.control....)
classificador = rpart(formula = risco ~ ., data = base, control = rpart.control(minbucket = 1 ))
plot(classificador)
text(classificador)
print(classificador)

#install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(classificador)

#historia: ruim, divida: alta, garantias: adequada, renda: 0_15 ou <15
#historia: boa, divida: alta, garantias: nenhuma, renda: >35


historia = c('boa', 'ruim')
divida = c('alta', 'alta')
garantias = c('nenhuma', 'adequada')
renda = c('acima_35', '0_15')
df = data.frame(historia, divida, garantias, renda)

previsoes = predict(classificador, newdata = df)
print(previsoes)

