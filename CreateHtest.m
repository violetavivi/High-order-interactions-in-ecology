%prevariables
nSpecies = 3;

%%Test 1: Hij + Hji = 1
H1 = CreateH(nSpecies);
theoSol = nSpecies*nSpecies/2;
codeSol = sum(sum(H1));
assert(theoSol == codeSol,'Hij + Hji ~= 1')

%HOW IS IT WORK?:
%Run
%result = runtests('CreateHtest')
% rt = table(result)