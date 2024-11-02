data <- read.csv('data/el_behav_vars.csv')

p.explicit <- ggplot(data, aes(x = Explicit)) +
    theme_classic(base_size = 15) +
    xlab('Explicit') + ylab('') +
    geom_vline(xintercept = c(-45,45), linetype = 'dashed') +
    geom_vline(xintercept = c(0), linetype = 'solid') +
    geom_histogram(fill = '#1e991e') +
    scale_x_continuous(limits = c(-61,61), breaks = c(-45,45)) +
    coord_flip() +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank())

p.implicit <- ggplot(data, aes(x = Implicit)) +
    theme_classic(base_size = 15) + 
    xlab('Implicit') + ylab('') +
    geom_vline(xintercept = c(-45,45), linetype = 'dashed') +
    geom_vline(xintercept = c(0), linetype = 'solid') +
    geom_histogram(fill = '#c97506') +
    scale_x_continuous(limits = c(-61,61), breaks = c(-45,45)) +
    coord_flip()  +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank())

p.early <- ggplot(data, aes(x = Early)) +
    theme_classic(base_size = 15) +
    xlab('Early error (deg)') + ylab('') +
    geom_vline(xintercept = c(-45,45), linetype = 'dashed') +
    geom_vline(xintercept = c(0), linetype = 'solid') +
    geom_histogram(fill = 'black') +
    scale_x_continuous(limits = c(-61,61), breaks = c(-45,45)) +
    coord_flip()  +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank())

layout <- "ABC"
plot.elbehavstats <-
    p.explicit + p.implicit + p.early + 
    plot_layout(design = layout)
