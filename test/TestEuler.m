classdef (SharedTestFixtures={matlab.unittest.fixtures.PathFixture( ...
        '../src')}) TestEuler < matlab.unittest.TestCase
	
methods (Test)
	function testExact(testCase)		
		fct = @(t,y) -2.2; y0 = 1;
		y_ex = @(t) 1 -2.2*t; tspan = [0,5];
        
		[temps , y] = euler_exp(fct ,tspan, y0, 100);
		erreur_rel = norm(y - y_ex(temps),inf)/norm(y_ex(temps),inf);
		verifyLessThan(testCase,erreur_rel,1e-14);
	end
end
end