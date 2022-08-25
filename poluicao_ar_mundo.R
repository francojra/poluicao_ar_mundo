
# Poluição do ar no mundo ------------------------------------------------------------------------------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------------------------------------------------------------
# Data: 24/08/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/air-pollution -------------------------------------------------------------------------------------

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
library(pals)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

pol <- read.csv("death-rates-total-air-pollution.csv")
view(pol)
names(pol)

# Manipulação de dados ---------------------------------------------------------------------------------------------------------------------

pol1 <- pol %>%
  select(-Code) %>%
  rename(mortes = Deaths...Cause..All.causes...Risk..Air.pollution...Sex..Both...Age..Age.standardized..Rate.)
view(pol1)

pol2 <- pol1 %>%
  filter(Entity %in% c("Angola", "Brazil", "China", "Russsia",
                       "United States", "France", "Germany",
                       "Ghana", "India", "Haiti", "Hungary", 
                       "Iceland", "Israel", "Portugal", "Italy")) %>%
  group_by(Entity) %>%
  summarise(media = mean(mortes), sd = sd(mortes),
            n = n(), se = sd/sqrt(n))
view(pol2)

pol3 <- pol1 %>%
  filter(Entity %in% c("Angola", "Brazil", "China", "Russsia",
                       "United States", "France", "Germany",
                       "Ghana", "India", "Haiti", "Hungary", 
                       "Iceland", "Israel", "Portugal", "Italy")) 
view(pol3)

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------

ggplot(pol2, aes(x = fct_reorder(Entity, media), y = media)) +
  geom_col() +
  geom_errorbar(aes(x = Entity, y = media, 
                    ymin = media - se, ymax =  media + se),
                size = 0.8, width = 0.3) +
  coord_flip() +
  labs(x = "Países", y = "Número médio de mortes por poluição do ar") +
  theme_bw()

ggplot(pol3, aes(x = Year, y = mortes, group = Entity, col = Entity)) +
  geom_point(size = 3) +
  geom_line(size = 1.4) +
  scale_color_manual(values = as.vector(alphabet(14))) +
  labs(x = "Tempo", y = "Número médio de mortes por poluição do ar",
       col = "Países") +
  theme_bw()
