#=
Julia EpanetToolkit
=#
using Libdl
using PyCall

lib_path = "../optimized-calibration/libs-epanet/EPANET/build/lib/libepanet2.so"
lib = Libdl.dlopen(lib_path) # Open the library explicitly.

#=
*Lista de funções a serem chamadas
ENopen()
ENopenH()
ENclose()
ENcloseH()
ENsolve()
ENgetnodevalue()
ENgetnodeindex()
ENsetnodevalue()
ENgetlinkvalue()
ENgetlinkindex()

ENgeterror()
=#


# ENgeterror()
#=
function ENtoolkitError(erro)
    sym = Libdl.dlsym(lib,:ENgeterror)
    errmsg = ""
    maxLen = 500
    ccall(sym, Cint,(Cint,Cstring,Cint), erro,errmsg,maxLen)
    return errmsg
end
=#

#ENopen
function open(inpFile::String, rptFile::String, outFile::String)
    sym = Libdl.dlsym(lib, :ENopen)
    err = ccall(sym, Cint, (Cstring,Cstring,Cstring), inpFile, rptFile, outFile)
    if err != 0
        return "Erro: "*err
    end
end

#ENopenH()
function openH()
    err = Libdl.dlsym(lib, :EN_openH)

end

