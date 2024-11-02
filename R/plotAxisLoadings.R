data <- read.csv('data/axis_loadings.csv')

plotdata <- ddply(data, c('Axis', 'Network', 'Coarsenet'), summarize,
               'Loading' = mean(Loading))

# Factor ordering for ggplot
plotdata$Axis <- factor(plotdata$Axis, c('Explicit', 'Performance', 'Implicit',
                                         'Late Explicit'))
plotdata$Network <- factor(plotdata$Network, 
                           c('DefaultA', 'DefaultB', 'DefaultC',
                             'ContA', 'ContB', 'ContC',
                             'LimbicA', 'LimbicB', 'TempPar',
                             'SalVentAttnA', 'SalVentAttnB',
                             'DorsAttnA', 'DorsAttnB',
                             'VisCent', 'VisPeri',
                             'Subcortex', 'Cerebellum'))
plotdata$Coarsenet <- factor(plotdata$Coarsenet, 
                             c('Default', 'TempPar', 'Limbic', 'Control',
                               'VentAttn', 'DorsAttn', 'Visual', 
                               'Somatomotor', 'Subcortex', 'Cerebellum'))
colorlabels <- c('#f94144', '#f3722c', '#f8961e', '#f9c74f', 
                 '#90be6d', '#4d908e', '#277da1',
                 'black', 'black')

plot.axisloadings <-
    ggplot(plotdata, aes(x = Network, y = Loading, fill = Coarsenet)) +
        theme_bw(base_size = 15) + 
        facet_grid(Axis ~ ., scales = 'free') +
        geom_bar(stat = 'identity') +
        geom_hline(yintercept = 0) +
        xlab('') + ylab('Mean loading') +
        scale_fill_manual(values = colorlabels) +
        theme(legend.position = 'none',
              axis.text.x = element_text(angle = -45, hjust = 0))
