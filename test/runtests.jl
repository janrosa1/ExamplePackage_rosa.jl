using ExamplePackage_rosa
using Test

@testset "ExamplePackage_rosa.jl" begin
    testfn(x)= (x-1)^3
    testfn_prime(x)=3*(x-1)^2
    testfn1(x)= exp(x)-1
    testfn_prime1(x)=exp(x)
    testfn2(x)= atan(x)
    testfn_prime2(x)= 1/((x)^2+1) 

    #test for functions with derivative

    root1, conv, iter  = ExamplePackage_rosa.newtonroot(testfn,testfn_prime,x_0=0.0)
    root2, conv, iter  = ExamplePackage_rosa.newtonroot(testfn1,testfn_prime1,x_0=1.0)
    root3, conv, iter  = ExamplePackage_rosa.newtonroot(testfn1,testfn_prime1,x_0=-0.3)

    @test abs(root1-1.0)<1e-6
    @test abs(root2 - 0.0)<1e-6
    @test abs(root3 - 0.0)<1e-6

    #do the same for functions without derivative

    root1, conv, iter  = ExamplePackage_rosa.newtonroot(testfn,x_0=0.0)
    root2, conv, iter  = ExamplePackage_rosa.newtonroot(testfn1,x_0=1.0)
    root3, conv, iter  = ExamplePackage_rosa.newtonroot(testfn1,x_0=-.4)

    @test abs(root1-1.0)<1e-6
    @test abs(root2 - 0.0)<1e-6
    @test abs(root3 - 0.0)<1e-6

    #check lack iof convergence
    
    test_nc(x) = x^2+1

    answer  = ExamplePackage_rosa.newtonroot(test_nc,x_0=1.0)
    @test answer==nothing


end
