sexMapper <- function(s){
  if(substr(tolower(s),1,1) == "м")
  {"мужской"}
  else
  {"женский"}
}

sexMapper <- Vectorize(sexMapper)
sex_to_plot <- read_csv("mad_questionary.csv") %>%
  mutate(sex=sexMapper(sex))

sexMapper <- Vectorize(sexMapper)
sex_to_plot <- sex_to_plot %>%
  mutate(age=Vectorize(function(s){str_split_1(s, " ")[1]})(age))

sex_to_plot %>% ggplot(aes(as.numeric(age), fill=sex)) +
  geom_dotplot(method="histodot", binwidth=1.5) +
  labs(x="age", color="sex") + 
  scale_y_continuous(NULL, breaks = NULL)
