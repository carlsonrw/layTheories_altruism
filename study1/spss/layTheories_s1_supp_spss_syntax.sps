USE ALL.
COMPUTE filter_$=(condition>1).
VARIABLE LABELS filter_$ 'condition>1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM actMO_avg_e_self actMO_avg_m_self actMO_avg_o_self actMO_avg_s_self BY condition
  /WSFACTOR=Benefit 4 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ HOMOGENEITY 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Benefit 
  /DESIGN=condition.

GLM actMO_avg_e_alt actMO_avg_m_alt actMO_avg_o_alt actMO_avg_s_alt BY condition
  /WSFACTOR=Benefit 4 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ HOMOGENEITY 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Benefit 
  /DESIGN=condition.

