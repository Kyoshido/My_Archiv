###############################################################################
###############################################################################
###############################################################################

# Capture object --------------------------------------------------------------

sink("output.txt")
print(mylist)
sink()

# Capture lm/glm --------------------------------------------------------------

capture.output(summary(m1),file="Summary_glmfit_quasipoisson.txt")


# -----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################
