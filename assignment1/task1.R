to_plot <- read_csv("UK_pubs.csv") %>% 
  count(pub_name, sort=TRUE) %>% 
  mutate(name_symbols=nchar(pub_name))

to_plot %>%
  slice(1:40) %>%
  ggplot(aes(name_symbols, n, label=pub_name)) + geom_point() +
  labs(x="number of symbols",
       y="number of bars",
       title = "40 most popular bar names in the UK",
       caption = "data from https://pudding.cool/2019/10/pubs/") +
  geom_text_repel()