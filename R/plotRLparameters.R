data.pars <- read.csv('data/rltask_modelparameters.csv')
data.pars$Parameter <- factor(data.pars$Parameter, c('L', 'U', 'm', 'k'))
data.time <- read.csv('data/rltask_timingdata.csv')
data.time$Epoch <- factor(data.time$Epoch, c('Pre-learning', 'Learning', 'Post-learning'))

plot.rlparameters <-
    ggplot(data.pars, aes(x = Value)) +
        theme_classic() +
        facet_grid(. ~ Parameter, scales = 'free') +
        geom_histogram(bins = 15, color = 'white', fill = 'black')

plot.rltimeeffects <-
    ggplot(data.time, aes(x = Epoch, y = Time)) +
        theme_classic() +
        facet_wrap( ~ Phase, scales = 'free', nrow = 1) +
        stat_summary(fun = mean, geom = 'line', group = -1) +
        stat_summary(fun.data = mean_se, group = -1)





