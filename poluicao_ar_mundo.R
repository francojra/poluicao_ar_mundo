
# Poluição do ar no mundo ------------------------------------------------------------------------------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------------------------------------------------------------
# Data: 21/08/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/quality-of-education ------------------------------------------------------------------------------

# Sobre os dados ---------------------------------------------------------------------------------------------------------------------------

### Poluição do ar é uma questão ambiental e de saúde pública em 
### todo o mundo, mas com diferentes graus de severidade.

### Os dados apresentam medidas do número de mortes a cada 100 mil
### pessoas em uma determinada região.

### O fardo da poluição do ar tende a ser maior em torno de países
### de renda média e baixa por duas razões: devido à dependência
### de combustíveis sólidos para preparar alimentos e devido à
### industrialização dos países que saem da renda baixa.

# Pacotes necessários para as análises -----------------------------------------------------------------------------------------------------

library(tidyverse)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

pol <- read.csv("death-rates-total-air-pollution.csv")
view(pol)
names(pol)

# Manipulação de dados ---------------------------------------------------------------------------------------------------------------------

pol1 <- pol %>%
  select(-Code) %>%
  rename(mortes = Deaths...Cause..All.causes...Risk..Air.pollution...Sex..Both...Age..Age.standardized..Rate.)
view(pol1)
