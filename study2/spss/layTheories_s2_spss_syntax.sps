
DATASET ACTIVATE DataSet5.
USE ALL.
COMPUTE filter_$=(condition > 1 AND condition < 4).
VARIABLE LABELS filter_$ 'condition > 1 AND condition < 4 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM alt_comp_e alt_comp_m alt_comp_o alt_comp_s BY condition
  /WSFACTOR=Benefit 4 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ HOMOGENEITY 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Benefit 
  /DESIGN=condition.
