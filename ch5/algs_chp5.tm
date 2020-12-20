<TeXmacs|1.99.17>

<style|<tuple|generic|centered-program>>

<\body>
  <doc-data|<doc-title|Numerical Analysis Review>|<\doc-author>
    Chapter 5

    \;

    <date|>
  </doc-author>>

  This chapter contains following algorithms.

  <\itemize>
    <item>Steepest descent

    <item>Conjugate gradient descent
  </itemize>

  <strong|Solving Positive Definite Linear System>

  Consider solving following linear system

  <\equation*>
    A x=b
  </equation*>

  with <math|A\<succ\>0>. Note that <math|A x-b> can be viewed as the
  optimality condition of following quadratic program

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|x>>|<cell|<frac|1|2>x<rsup|\<top\>>A
    x-b<rsup|\<top\>>x>|<cell|\<backassign\>f<around*|(|x|)>>>>>
  </eqnarray*>

  and if we find optimal solution <math|x<rsup|\<ast\>>> to above QP, then we
  get <math|A x<rsup|\<ast\>>=b> naturally.

  <strong|Steepest Descent>

  One popular way to solve QP is steepest descent. Assume that we are at
  <math|x<rsub|k>> and next iterate is given by

  <\equation*>
    x<rsub|k+1>=x<rsub|k>-arg min<rsub|t>
    f<around*|(|x<rsub|k>-t\<nabla\>f<around*|(|x<rsub|k>|)>|)>
    \<cdummy\>\<nabla\>f<around*|(|x<rsub|k>|)>.
  </equation*>

  \;

  In other words, we have

  <\equation*>
    t<rsub|k>= arg min<rsub|t> f<around*|(|x<rsub|k>-t\<nabla\>f<around*|(|x<rsub|k>|)>|)>,
  </equation*>

  <\equation*>
    x<rsub|k+1>=x<rsub|k>-t<rsub|k>\<nabla\>f<around*|(|x<rsub|k>|)>.
  </equation*>

  Problem to get <math|t<rsub|k>> is actually a quadratic minimization
  problem in <math|\<bbb-R\>> and has closed-form solution of\ 

  <\equation*>
    t<rsub|k>=-<frac|<around*|\<\|\|\>|A x<rsup|k>-b|\<\|\|\>><rsup|2><rsub|2>|<around*|\<\|\|\>|A
    x<rsup|k>-b|\<\|\|\>><rsup|2><rsub|A>>.
  </equation*>

  Hence we have iterates of steepest descent given by

  <\named-algorithm|1. Steepest Descent for Linear System<space|15em>>
    <strong|Input> <math|A,b,\<varepsilon\>>

    <strong|Initialize> <math|x=x<rsub|0>>

    <strong|while> <math|<around*|\<\|\|\>|A
    x-b|\<\|\|\>><rsub|2>\<gtr\>\<varepsilon\>>

    \;

    <space|2em><math|t=-<frac|<around*|\<\|\|\>|A
    x-b|\<\|\|\>><rsup|2><rsub|2>|<around*|\<\|\|\>|A
    x-b|\<\|\|\>><rsup|2><rsub|A>>>

    <space|2em><math|x=x-t<around*|(|A x-b|)>>

    \;

    <strong|end while>

    <strong|Output> <math|x>
  </named-algorithm>
</body>

<initial|<\collection>
</collection>>