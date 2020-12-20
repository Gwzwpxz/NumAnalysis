<TeXmacs|1.99.17>

<style|generic>

<\body>
  <doc-data|<doc-title|Numerical Analysis Review>|<\doc-author>
    Chapter 3

    \;

    <date|>
  </doc-author>>

  This chapter contains following algorithms.

  <\itemize>
    <item>Householder transformation

    <item>Givens transformation

    <item>QR decomposition
  </itemize>

  <strong|Ordinary Least Squares>

  Consider fitting a linear regression model with data
  <math|X\<in\>\<bbb-R\><rsup|n\<times\>p>> and
  <math|y\<in\>\<bbb-R\><rsup|n>>. Without loss of generality we assume that
  <math|n\<geq\>p> and that <math|rank<around*|(|X|)>=p>. Then OLS is to
  solve following optimization problem

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|\<beta\>>>|<cell|<around*|\<\|\|\>|X\<beta\>-y|\<\|\|\>><rsup|2><rsub|2>>|<cell|>>>>
  </eqnarray*>

  and we change notation to write\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|min<rsub|x>>|<cell|<around*|\<\|\|\>|A
    x-b|\<\|\|\>><rsup|2><rsub|2>>|<cell|.>>>>
  </eqnarray*>

  Recall that for <math|Q\<in\>\<cal-O\><rsub|\<cal-X\><rsub|n>>>, we have
  <math|<around*|\<\|\|\>|Q<around*|(|A x-b|)>|\<\|\|\>><rsup|2><rsub|2>=<around*|\<\|\|\>|A
  x-b|\<\|\|\>><rsup|2><rsub|2>> and if we do QR decomposition to obtain
  <math|A=Q R=Q<matrix|<tformat|<table|<row|<cell|R<rsub|1>>>|<row|<cell|0>>>>>>,
  where <math|R\<in\>\<bbb-R\><rsup|n\<times\>p>> and
  <math|R<rsub|1>\<in\>\<bbb-R\><rsup|p\<times\>p>>. We equivalently get

  <\equation*>
    <around*|\<\|\|\>|A x-b|\<\|\|\>><rsup|2><rsub|2>=<around*|\<\|\|\>|Q R
    x-b|\<\|\|\>><rsup|2><rsub|2>=<around*|\<\|\|\>|Q<rsup|\<top\>>Q R
    x-Q<rsup|\<top\>>b|\<\|\|\>><rsup|2><rsub|2>=<around*|\<\|\|\>|<matrix|<tformat|<table|<row|<cell|R<rsub|1>x<rsub|1>>>|<row|<cell|0>>>>>-<matrix|<tformat|<table|<row|<cell|Q<rsup|\<top\>>b<rsub|<around*|[|1|]>>=b<rsub|1>>>|<row|<cell|Q<rsup|\<top\>>b<rsub|<around*|[|2|]>>=b<rsub|2>>>>>>|\<\|\|\>><rsup|2><rsub|2>.
  </equation*>

  Hence we can equilvalently solve the linear system
  <math|R<rsub|1>x=b<rsub|1>> to get <math|x<rsub|1>> and return to
  <math|><math|Q<matrix|<tformat|<table|<row|<cell|R<rsub|1>x<rsub|1>>>|<row|<cell|0>>>>>>
  after solution.
</body>

<initial|<\collection>
</collection>>