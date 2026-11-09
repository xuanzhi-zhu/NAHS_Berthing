function out = h_ast(s,parameters)

slope_h_ast=parameters.para_h_ast.slope_h_ast;
intercept_h_ast=parameters.para_h_ast.intercept_h_ast;

out=slope_h_ast*s+intercept_h_ast;

end

