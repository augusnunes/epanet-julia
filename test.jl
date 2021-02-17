include("epamodule.jl")
em = Main.epamodule
rede_path = "/home/augusto/Documents/IC-2020/optimized-calibration/networks/c-town/C-Town.inp"

em.ENopen(rede_path)
em.ENopenH()

link = "P2"
rugosidade = 0.001
em.ENsetlinkvalue(em.ENgetlinkindex(link), em.EN_ROUGHNESS, rugosidade)
em.ENsolveH()
println("Teste tubulações:")
println(em.ENgetlinkvalue(em.ENgetlinkindex(link), em.EN_ROUGHNESS)) 
println(rugosidade)

node = "J414"
em.ENsolveH()
println("Teste nós:")
println(em.ENgetnodevalue(em.ENgetnodeindex(node), em.EN_PRESSURE)) 


em.ENcloseH()
em.ENclose()