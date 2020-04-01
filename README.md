# NOMAD_matlab_minimal
 
- Run "GERAD_NOMAD_build.m" in $(NOMADHOMEPERSONAL)\examples\interfaces\Matlab_MEX
- Run "main_blind.m"
- Set NOMAD parameters using the `nomadset` function
- Modify blackbox program "blackbox.m" as necessary
- Must unscale variables inside blackbox for evaluation using `scaling` command:
 - `x_s = scaling(x,lb,ub,1)` to scale
 - `x_s = scaling(x,lb,ub,2)` to unscale
