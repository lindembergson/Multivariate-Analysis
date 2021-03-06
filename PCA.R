## Componentes Principais no R ##

## LIVRO: M�todos de An�lise Multivariada em R de Anderson Silva

# Carregando o banco de dados:

data("mtcars")
mtcars

# An�lise Descritiva:

# vetor de totais:
totais = colSums(mtcars); totais
 
# Vetor de m�dias
media = colMeans(mtcars); media
      #ou
media = apply(mtcars, 2, mean); media

# matriz de variancia e covariancia:
S = cov(mtcars)
cov(mtcars);S

# Coeficiente de Varia��o:
cv = function(x){100* sd(x) / mean(x)}
apply(mtcars,2,cv)

# Matriz de Correla��o:
R = cor(mtcars); R

#### Elipses de Correla��o:
library(plotrix)
library(ellipse)

## Matriz  de cores:
mcores = color.scale(1-abs(R))
plotcorr(R,col = mcores)

### Componentes Principais

acp = princomp(mtcars, cor = T); acp
summary(acp)
screeplot(acp)

print(acp$loadings, cutoff = 0)

imp_var = function(dados, componente){
acp = princomp(dados, cor = T)
barplot(acp$loadings[,componente], beside = T, 
        col = sign(acp$loadings[,componente]) + 3, ylim = c(-0.5,0.5),
           ylab = "import�ncia", xlab = "Vari�veis",
           main = "Importancia da vari�vel")
            }
imp_var(dados = mtcars,1)



plot(acp$loadings[,1],acp$loadings[,2])
biplot(acp,scale = 0)
