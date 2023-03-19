library(tidyverse)

#This script is intended to be used for displaying VCF summary statistics 
#once VCFtools has been used to calculate those statistics. Metrics
#can then be used to filter VCF for quality, depth, and missingness.

#Every line that reads in a file includes the needed file extension.



# [========================]
#  Variant based statistics 
# [========================]

# --------------------
# Variant quality ----
# --------------------

#read data
var_qual <- read_delim("<your_output_file_here>.lqual", delim = "\t",
                       col_names = c("chr", "pos", "qual"), 
                       skip = 1)

#plot distributions
a <- ggplot(var_qual, aes(qual)) + geom_density(fill = "dodgerblue1",
                                                colour = "black", alpha = 0.3)
a + theme_light() + xlim(0, 100)

#save plot png
ggsave(
  "var_quality.png",
  device = NULL,
  scale = 1,
  width = 5,
  height = 5,
  units = c("in"),
  dpi = 300)

#calculate summary statistic
summary(var_qual$qual)

# -----------------------
# Variant mean depth ----
# -----------------------

#read data
var_depth <- read_delim("<your_output_file_here>.ldepth.mean", delim = "\t",
                        col_names = c("chr", "pos", "mean_depth", 
                                      "var_depth"), skip = 1)

#plot distributions
b <- ggplot(var_depth, aes(mean_depth)) + geom_density(fill = "dodgerblue1",
                                                       colour = "black", alpha = 0.3)
b + theme_light()

#save plot png
ggsave(
  "var_depth.png",
  device = NULL,
  scale = 1,
  width = 5,
  height = 5,
  units = c("in"),
  dpi = 300)

#calculate summary statistic
summary(var_depth$mean_depth)

# ------------------------
# Variant missingness ----
# ------------------------

#read data
var_miss <- read_delim("<your_output_file_here>.lmiss", delim = "\t",
                       col_names = c("chr", "pos", "nchr", 
                                     "nfiltered", "nmiss", "fmiss"), 
                       skip = 1)

#plot
c <- ggplot(var_miss, aes(fmiss)) + geom_density(fill = "dodgerblue1",
                                                 colour = "black", alpha = 0.3)
c + theme_light()

#save plot png
ggsave(
  "var_missingness.png",
  device = NULL,
  scale = 1,
  width = 5,
  height = 5,
  units = c("in"),
  dpi = 300)

#calculate summary statistic
summary(var_miss$fmiss)



# [===========================]
#  Individual based statistics 
# [===========================]

# ------------------------------
# Mean depth per individual ----
# ------------------------------

#read data
ind_depth <- read_delim("<your_output_file_here>.idepth", delim = "\t",
                        col_names = c("ind", "nsites", "depth"), skip = 1)

#plot
d <- ggplot(ind_depth, aes(depth)) + geom_histogram(fill = "dodgerblue1",
                                                    colour = "black", alpha = 0.3)
d + theme_light()

#save plot png
ggsave(
  "ind_depth.png",
  device = NULL,
  scale = 1,
  width = 5,
  height = 5,
  units = c("in"),
  dpi = 300)

#calculate summary statistic
summary(ind_depth$depth)

# ----------------------------------------------
# Proportion of missing data per individual ----
# ----------------------------------------------

#read data
ind_miss  <- read_delim("<your_output_file_here>.imiss", delim = "\t",
                        col_names = c("ind", "ndata", "nfiltered", 
                                      "nmiss", "fmiss"), skip = 1)

#plot
e <- ggplot(ind_miss, aes(fmiss)) + geom_histogram(fill = "dodgerblue1",
                                                   colour = "black", alpha = 0.3)
e + theme_light()

#save plot png
ggsave(
  "ind_missingness.png",
  device = NULL,
  scale = 1,
  width = 5,
  height = 5,
  units = c("in"),
  dpi = 300)



