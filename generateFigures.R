require('plyr')
require('ggplot2')
require('patchwork')

# Plot subjects' estimated implicit and explicit adaptation, along with
# their early error (see figure 1)
source('R/plotELbehaviour.R')
plot.elbehavstats

# Imports and plots the mean loadings for the implicit, explicit, and 
# performance axes, as well as the explicit axis derived from late learning
# (see figure 3, and supplemental figure 6)
source('R/plotAxisLoadings.R')
plot.axisloadings

# Plot parameters estimated from sigmoid fits to subjects' RL data, as well
# as changes in reaction and movement times during each learning epoch
# (figure 4)
source('R/plotRLparameters.R')
plot.rlparameters
plot.rltimeeffects

# Correlations between RL learning rate and the change in axis expression during
# the RL learning period., for each combination of axis, hemisphere, and 
# motor network (figure 6)
source('R/plotAxisCorrelations.R')
plot.axiscorrelations
