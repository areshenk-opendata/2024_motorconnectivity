data <- read.csv('data/axis_expression_data.csv')

data <- ddply(data, c('Mot', 'Hem', 'Axis'), summarize,
              'r' = cor(LearningRate, AxisIncrease))
data$id <- paste(data$Hem, data$Mot)
data$id <- factor(data$id, c('LH SomMotB', 'LH SomMotA', 'RH SomMotA', 'RH SomMotB'))
data$Axis <- factor(data$Axis, c('Explicit', 'Implicit', 'Performance'))

plot.axiscorrelations <-
    ggplot(data, aes(x = Axis, y = r, fill = Axis)) +
    theme_classic() +
    geom_bar(stat = 'identity') +
    facet_grid(. ~ id) +
    scale_fill_manual(values = c('#1b9e77', '#d95f02', 'blue')) +
    theme(axis.text.x = element_text(angle = -45, hjust = 0))
