include("epamodule.jl")
em = Main.epamodule
rede_path = "/home/augusto/Documents/IC-2020/optimized-calibration/networks/c-town/C-Town.inp"

em.ENopen(rede_path)
em.ENopenH()


em.ENcloseH()
em.ENclose()