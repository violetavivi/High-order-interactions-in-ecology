% test recursivity
X = [1; 2; 3];
Hdiag = eye(3);
Xresult2 = 2*X.*X;
Hones = ones(3);
Xresult3 = [12; 24; 36];

%% Test 1: when m = 1
q = recursiveQ(1,X,Hdiag);
assert(isequal(q, X),'Fundamental problem: with m = 1, q~= X ')
 
%% Test 2: when m = 2, H diag
q = recursiveQ(2,X,Hdiag);
assert(isequal(q, Xresult2),'Problem: with m = 2, H diag')

%% Test 3: when m = 2, H ones
q = recursiveQ(2,X,Hones);
assert(isequal(q, Xresult3),'Problem: with m = 2, H ones')

%WHAT TO DO: 
%result = runtests('recursiveQtest');
%rt = table(result)