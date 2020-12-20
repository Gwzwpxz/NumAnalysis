function [] = checkres(test, res)

if sum(res) == length(res)
    fprintf("\n " + test + ": passed. \n");
else 
    fprintf("\n " + test + ": failed. \n");
end % End if

end % End function