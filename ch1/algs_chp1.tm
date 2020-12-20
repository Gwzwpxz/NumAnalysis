<TeXmacs|1.99.17>

<style|<tuple|generic|centered-program>>

<\body>
  <\hide-preamble>
    \;

    <assign|algorithm-text|<macro|<localize|Algorithm>>>
  </hide-preamble>

  <doc-data|<doc-title|Numerical Analysis Review>|<\doc-author>
    Chapter 1

    \;

    <date|>
  </doc-author>>

  This chapter contains following algorithms.

  <\itemize>
    <item>Forward/backward elimination

    <item><math|L U> decomposition (with pivot)

    <item>Cholesky decompositon

    <item><math|L D L<rsup|\<top\>>> decomposition
  </itemize>

  <strong|Forward/backward elimination>

  Consider a linear system given by

  <\equation*>
    A x=b
  </equation*>

  and we assume that <math|A\<in\>\<bbb-R\><rsup|n\<times\>n>> is full-rank.
  Specially if we have <math|A=L> or <math|U>, where

  <\equation*>
    L=<matrix|<tformat|<table|<row|<cell|l<rsub|11>>|<cell|>|<cell|>|<cell|>>|<row|<cell|l<rsub|21>>|<cell|\<ddots\>>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|l<rsub|n1>>|<cell|l<rsub|n2>>|<cell|\<ldots\>>|<cell|l<rsub|n
    n>>>>>>,<space|2em>U=<matrix|<tformat|<table|<row|<cell|u<rsub|11>>|<cell|u<rsub|12>>|<cell|\<cdots\>>|<cell|u<rsub|1n>>>|<row|<cell|>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|>|<cell|>|<cell|\<ddots\>>|<cell|u<rsub|n-1,n>>>|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|n
    n>>>>>>
  </equation*>

  , then the system can be solved in a recursive manner. e.g., for <math|L
  x=b>, we have

  <\equation*>
    x<rsub|k>=<frac|1|l<rsub|k k>><around*|(|b<rsub|k>-<big|sum><rsub|i=1><rsup|k-1>l<rsub|k
    i>x<rsub|i>|)>,k=1,\<ldots\>,n
  </equation*>

  and for <math|U x=b>, we have

  <\equation*>
    x<rsub|k>=<frac|1|u<rsub|k k>><around*|(|b<rsub|k>-<big|sum><rsub|i=k+1><rsup|n>l<rsub|k
    i>x<rsub|i>|)>,k=n,\<ldots\>,1.
  </equation*>

  The above gives basic algorithm for computing solution to linear system in
  terms of lower/upper triangular coefficient matrices.

  \;

  \;

  \;
</body>

<initial|<\collection>
</collection>>