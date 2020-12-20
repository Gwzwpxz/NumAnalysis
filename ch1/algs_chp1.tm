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

  and we assume that <math|A\<in\>\<bbb-R\><rsup|n\<times\>n>> is full-rank.\ 

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
  terms of lower/upper triangular coefficient matrices. Now we format the
  above as following algorithm.

  <with|algorithm-text|<\macro>
    <localize|Algorithm>
  </macro>|<\named-algorithm|1. L/U solve<space|26em> >
    <strong|Input> <math|L<around*|(|U|)>,b>

    <strong|for> <math|k=1,\<ldots\>,n> (<math|k=n,\<ldots\>,1> for <math|U>)

    \;

    <space|2em><math|x<rsub|k>=<frac|1|l<rsub|k
    k>><around*|(|b<rsub|k>-<big|sum><rsub|i=1><rsup|k-1>l<rsub|k
    i>x<rsub|i>|)>>

    <space|2em><strong|or> <math|x<rsub|k>=<frac|1|u<rsub|k
    k>><around*|(|b<rsub|k>-<big|sum><rsub|i=k+1><rsup|n>l<rsub|k
    i>x<rsub|i>|)>>

    \;

    <strong|end for>

    <strong|Output> <math|x>
  </named-algorithm>>

  \;

  <strong|LU Decomposition (with pivot)>

  Now we consider, more generally, a linear system\ 

  <\equation*>
    A x=b,
  </equation*>

  where <math|A\<in\>\<bbb-R\><rsup|n\<times\>n>> is full-rank.\ 

  By theory of Gauss-Elimination, we have

  <\equation*>
    <matrix|<tformat|<table|<row|<cell|a<rsub|11>>|<cell|a<rsub|12>>|<cell|\<cdots\>>|<cell|a<rsub|1n>>>|<row|<cell|a<rsub|21>>|<cell|a<rsub|22>>|<cell|\<cdots\>>|<cell|a<rsub|2n>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|a<rsub|n1>>|<cell|a<rsub|n2><rsub|>>|<cell|\<ldots\>>|<cell|a<rsub|n
    n>>>>>><above|\<Longrightarrow\>|<text|<space|1em>Gauss<space|1em>>><matrix|<tformat|<table|<row|<cell|a<rsub|11>>|<cell|a<rsub|12>>|<cell|\<cdots\>>|<cell|a<rsub|1n>>>|<row|<cell|0>|<cell|a<rsub|22>-<frac|a<rsub|21>|a<rsub|11>>a<rsub|12>>|<cell|\<cdots\>>|<cell|a<rsub|2n>-<frac|a<rsub|21>|a<rsub|11>>a<rsub|1n>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|0>|<cell|a<rsub|n2><rsub|>-<frac|a<rsub|n1>|a<rsub|11>>a<rsub|12>>|<cell|\<ldots\>>|<cell|a<rsub|n
    n>-<frac|a<rsub|21>|a<rsub|11>>a<rsub|1n>>>>>>
  </equation*>

  and process of elimination can be viewed as imposing some row
  transformation <math|L<rsub|1>> to the original matrix

  <\equation*>
    L<rsub|1>A=<matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|-<frac|a<rsub|21>|a<rsub|11>>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|-<frac|a<rsub|n1>|a<rsub|11>>>|<cell|0>|<cell|\<ldots\>>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|a<rsub|11>>|<cell|a<rsub|12>>|<cell|\<cdots\>>|<cell|a<rsub|1n>>>|<row|<cell|a<rsub|21>>|<cell|a<rsub|22>>|<cell|\<cdots\>>|<cell|a<rsub|2n>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|a<rsub|n1>>|<cell|a<rsub|n2><rsub|>>|<cell|\<ldots\>>|<cell|a<rsub|n
    n>>>>>>=A<rsub|1>.
  </equation*>

  Repeat the above procedures and assume that we never encounter 0 in the
  diagonal, then we have\ 

  <\equation*>
    <around*|(|L<rsub|n-1>\<cdots\>L<rsub|2>L<rsub|1>|)>A=U
  </equation*>

  and\ 

  <\equation*>
    A=<around*|(|L<rsub|n-1>\<cdots\>L<rsub|2>L<rsub|1>|)><rsup|-1>U=L U.
  </equation*>

  Here we recall that

  <\equation*>
    L<rsub|1>=<matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|-<frac|a<rsub|21>|a<rsub|11>>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|-<frac|a<rsub|n1>|a<rsub|11>>>|<cell|0>|<cell|\<ldots\>>|<cell|1>>>>><space|2em>L<rsup|-1><rsub|1>=<matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|<frac|a<rsub|21>|a<rsub|11>>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|<frac|a<rsub|n1>|a<rsub|11>>>|<cell|0>|<cell|\<ldots\>>|<cell|1>>>>>
  </equation*>

  and that

  <\equation*>
    L<rsup|-1><rsub|1>L<rsub|2><rsup|-1>=L<rsup|-1><rsub|1>=<matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|<frac|a<rsub|21>|a<rsub|11>>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|<frac|a<rsub|n1>|a<rsub|11>>>|<cell|0>|<cell|\<ldots\>>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|0>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|0>|<cell|<frac|<wide|a|^><rsub|n2>|<wide|a|^><rsub|22>>>|<cell|\<ldots\>>|<cell|1>>>>>=<matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|<frac|a<rsub|21>|a<rsub|11>>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|<frac|a<rsub|n1>|a<rsub|11>>>|<cell|<frac|<wide|a|^><rsub|n2>|<wide|a|^><rsub|22>>>|<cell|\<ldots\>>|<cell|1>>>>>.
  </equation*>

  Therefore we can compute

  <\equation*>
    L=L<rsup|-1><rsub|1>L<rsub|2><rsup|-1>\<cdots\>L<rsub|n-1><rsup|-1>=<matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|<frac|a<rsub|21>|a<rsub|11>>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|<frac|a<rsub|n1>|a<rsub|11>>>|<cell|<frac|<wide|a|^><rsub|n2>|<wide|a|^><rsub|22>>>|<cell|\<ldots\>>|<cell|1>>>>>.
  </equation*>

  Summarize the above and we get LU decomposition without pivoting.

  <with|algorithm-text|<\macro>
    <localize|Algorithm>
  </macro>|<\named-algorithm|2. LU decomposition (without
  pivoting)<space|14em> >
    <strong|Input> <math|A>

    <strong|Initialize> <math|<wide|A|^>=A,L=I>

    <strong|for> <math|k=1,\<ldots\>,n-1>

    \;

    <space|2em><math|L<rsub|<around*|[|k+1:n,k|]>>=<frac|<wide|A|^><rsub|<around*|[|k+1:n,k|]>>|<wide|A|^><rsub|<around*|[|k,k|]>>>>

    \;

    <space|2em><math|<wide|A|^>=L<rsub|k><wide|A|^>>

    \;

    <strong|end for>

    <strong|Output> <math|L,U=<wide|A|^>>
  </named-algorithm>>

  \;

  Recally that we require that no element encountered on the diagonal is 0
  and this is often not the case. Hence we consider LU decomposition with
  <strong|column pivoting>. i.e., if we encounter 0 on the diagonal, we
  implement row permutation <math|P> to move element of largest scale in the
  current column to diagonal

  <\equation*>
    <matrix|<tformat|<table|<row|<cell|a<rsub|11>=0>|<cell|a<rsub|12>>|<cell|\<cdots\>>|<cell|a<rsub|1n>>>|<row|<cell|a<rsub|21>>|<cell|a<rsub|22>>|<cell|\<cdots\>>|<cell|a<rsub|2n>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|a<rsub|n1>>|<cell|a<rsub|n2><rsub|>>|<cell|\<ldots\>>|<cell|a<rsub|n
    n>>>>>><above|\<Longrightarrow\>|<text|<space|1em>Permutation<space|1em>>><matrix|<tformat|<table|<row|<cell|<wide|a|^><rsub|21>>|<cell|a<rsub|12>>|<cell|\<cdots\>>|<cell|a<rsub|1n>>>|<row|<cell|0>|<cell|a<rsub|22>>|<cell|\<cdots\>>|<cell|a<rsub|2n>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|a<rsub|n1>>|<cell|a<rsub|n2><rsub|>>|<cell|\<ldots\>>|<cell|a<rsub|n
    n>>>>>>.
  </equation*>

  The above procedure gives, sequentially a series of row transformations as
  well as permutations to give

  <\equation*>
    L<rsub|n-1>P<rsub|n-1>\<cdots\>L<rsub|2>P<rsub|2>L<rsub|1>P<rsub|1>A=U
  </equation*>

  and if we let <math|P=P<rsub|n-1>P<rsub|n-2>\<cdots\>P<rsub|1>> and we have

  <\equation*>
    P A=<around*|(|P<rsub|n-1>P<rsub|n-2>\<cdots\>P<rsub|1>|)><around*|(|L<rsub|n-1>P<rsub|n-1>\<cdots\>L<rsub|2>P<rsub|2>L<rsub|1>P<rsub|1>|)><rsup|-1>U=L
    U,
  </equation*>

  where <math|L=<around*|(|P<rsub|n-1>P<rsub|n-2>\<cdots\>P<rsub|1>|)><around*|(|L<rsub|n-1>P<rsub|n-1>\<cdots\>L<rsub|2>P<rsub|2>L<rsub|1>P<rsub|1>|)><rsup|-1>>
  is a lower-triangular matrix. More detailedly, we can write

  <\eqnarray*>
    <tformat|<table|<row|<cell|>|<cell|>|<cell|<around*|(|P<rsub|n-1>P<rsub|n-2>\<cdots\>P<rsub|1>|)><around*|(|L<rsub|n-1>P<rsub|n-1>\<cdots\>L<rsub|2>P<rsub|2>L<rsub|1>P<rsub|1>|)><rsup|-1>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|P<rsub|n-1>P<rsub|n-2>\<cdots\>P<rsub|2>|)><around*|(|<with|color|red|L<rsub|1><rsup|-1>>P<rsub|2><rsup|-1>L<rsub|2><rsup|-1>\<cdots\>P<rsub|n-1><rsup|-1>L<rsub|n-1><rsup|-1>|)>>>|<row|<cell|>|<cell|=>|<cell|P<rsub|n-1>P<rsub|n-2>\<cdots\>P<rsub|3><with|color|red|<around*|[|<around*|(|P<rsub|2>L<rsub|1><rsup|-1>P<rsub|2><rsup|-1>|)>L<rsub|2><rsup|-1>|]>>P<rsup|-1><rsub|3>\<cdots\>P<rsub|n-1><rsup|-1>L<rsub|n-1><rsup|-1>>>|<row|<cell|>|<cell|=>|<cell|P<rsub|n-1>P<rsub|n-2>\<cdots\><with|color|red|<around*|[|<around*|(|P<rsub|3><wide|L|^><rsub|2>P<rsup|-1><rsub|3>|)>L<rsup|-1><rsub|3>|]>>\<cdots\>P<rsub|n-1><rsup|-1>L<rsub|n-1><rsup|-1>>>|<row|<cell|>|<cell|\<cdots\>>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<with|color|red|P<rsub|n-1><wide|L|^><rsub|n-2>L<rsub|n-1><rsup|-1>>>>>>
  </eqnarray*>

  and every <with|color|red|matrix> is lower-triangular by induction.

  Last we summarize above results in following algorithm.

  <with|algorithm-text|<\macro>
    <localize|Algorithm>
  </macro>|<\named-algorithm|3. LU decomposition (with column
  pivoting)<space|12em> >
    <strong|Input> <math|A>

    <strong|Initialize> <math|<wide|A|^>=A,L=I>

    <strong|for> <math|k=1,\<ldots\>,n-1>

    \;

    <space|2em><math|L<rsub|<around*|[|k+1:n,k|]>>=<frac|<wide|A|^><rsub|<around*|[|k+1:n,k|]>>|<wide|A|^><rsub|<around*|[|k,k|]>>>>

    \;

    <space|2em><strong|Choose> <math|P<rsub|k>=I<rsub|k,p>,p=arg
    max<rsub|p\<geq\>k><around*|\||<wide|a|^><rsub|p,k>|\|>>

    \;

    <space|2em><math|<wide|A|^>=L<rsub|k>P<rsub|k><wide|A|^>>

    \;

    <strong|end for>

    <strong|Output> <math|P=<big|prod><rsub|k>P<rsub|n-k-1>,L,U=<wide|A|^>>
  </named-algorithm>>

  \;

  <strong|Cholesky Decomposition>

  Now we consider a special case where the coefficient matrix <math|A> is
  symmetric and positive definite. i.e., <math|A\<succeq\>0> and by Cholesky
  decomposition theorem, we have that there exists a lower-triangular matrix
  <math|L> such that

  <\equation*>
    A=L L<rsup|<rsup|\<top\>>>=<matrix|<tformat|<table|<row|<cell|l<rsub|11>>|<cell|>|<cell|>|<cell|>>|<row|<cell|l<rsub|21>>|<cell|l<rsub|22>>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|l<rsub|n1>>|<cell|l<rsub|n2>>|<cell|\<cdots\>>|<cell|l<rsub|n
    n>>>>>><matrix|<tformat|<table|<row|<cell|l<rsub|11>>|<cell|l<rsub|21>>|<cell|\<cdots\>>|<cell|l<rsub|n1>>>|<row|<cell|>|<cell|l<rsub|22>>|<cell|\<cdots\>>|<cell|l<rsub|n2>>>|<row|<cell|>|<cell|>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|>|<cell|>|<cell|>|<cell|l<rsub|n
    n>>>>>>
  </equation*>

  It follows from formula of matrix multiplication that

  <\equation*>
    a<rsub|i j>=<big|sum><rsub|k=1><rsup|n>l<rsub|i k>l<rsub|k
    j>=<big|sum><rsub|k\<leq\>min<around*|{|i,j|}>><rsup|n>l<rsub|i
    k>l<rsub|k j>
  </equation*>

  \;

  and we can recursively get

  <\equation*>
    l<rsub|11><rsup|2>=a<rsub|11>,l<rsub|11>l<rsub|21>=a<rsub|21>,l<rsub|21><rsup|2>+l<rsup|2><rsub|22>=a<rsub|22>
    \<ldots\>
  </equation*>

  To sum up, we give the following algorithm on Cholesky decomposition.

  <\named-algorithm|4. Cholesky decomposition<space|20em> >
    <strong|Input> <math|A>

    <strong|Initialize> <math|L=\<b-0\>>

    <strong|for> <math|k=1,\<ldots\>,n>

    <space|2em><strong|for> <math|m=1,\<ldots\>,k-1>

    <space|4em><math|l<rsub|k m>=<frac|1|l<rsub|m m>><around*|(|a<rsub|k
    m>-L<rsub|<around*|[|k,1:m-1|]>>\<cdummy\>L<rsub|<around*|[|m,1:m-1|]>>|)>>

    <space|2em><strong|end for>

    <space|2em><math|l<rsub|k k>=<sqrt|a<rsub|k
    k>-<around*|\<\|\|\>|L<rsub|<around*|[|k,1:k-1|]>>|\<\|\|\>><rsup|2><rsub|2>>>

    <strong|end for>

    <strong|Output> <math|L>
  </named-algorithm>

  \;

  <strong|LDL Decomposition>

  Recall that in Cholesky decomposition we need to take squareroot of
  diagonal elements and this is not desirable for large-scale computations.
  Hence we can preserve the diagonal elements and alternatively decompose
  <math|A\<succeq\>0> into

  <\equation*>
    A=L D L<rsup|\<top\>>=<matrix|<tformat|<table|<row|<cell|1>|<cell|>|<cell|>|<cell|>>|<row|<cell|l<rsub|21>>|<cell|1>|<cell|>|<cell|>>|<row|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<ddots\>>|<cell|>>|<row|<cell|l<rsub|n1>>|<cell|l<rsub|n2>>|<cell|\<cdots\>>|<cell|1>>>>><matrix|<tformat|<table|<row|<cell|d<rsub|1>>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|d<rsub|2>>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|\<ddots\>>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|d<rsub|n>>>>>><matrix|<tformat|<table|<row|<cell|1>|<cell|l<rsub|21>>|<cell|\<cdots\>>|<cell|l<rsub|n1>>>|<row|<cell|>|<cell|1>|<cell|\<cdots\>>|<cell|l<rsub|n2>>>|<row|<cell|>|<cell|>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|>|<cell|>|<cell|>|<cell|1>>>>>
  </equation*>

  where <math|D=diag<around*|(|d|)>> is a diagonal matrix and
  <math|diag<around*|(|L|)>=\<b-1\>>.

  LDL decomposition is implemented exactly the same as Cholesky decomposition
  as we can write

  <\equation*>
    a<rsub|i j>=<big|sum><rsub|k\<leq\>min<around*|{|i,j|}>><rsup|n>d<rsub|k>l<rsub|i
    k>l<rsub|k j>.
  </equation*>

  This gives the algorithm below.

  <\named-algorithm|5. LDL decomposition<space|22em> >
    <strong|Input> <math|A>

    <strong|Initialize> <math|L=I,d=\<b-0\>>

    <strong|for> <math|k=1,\<ldots\>,n>

    <space|2em><strong|for> <math|m=1,\<ldots\>,k-1>

    <space|4em><math|l<rsub|k m>=<frac|1|d<rsub|m>><around*|(|a<rsub|k
    m>-d<rsub|<around*|[|1:m-1|]>>\<circ\>L<rsub|<around*|[|k,1:m-1|]>>\<cdummy\>L<rsub|<around*|[|m,1:m-1|]>>|)>>

    <space|2em><strong|end for>

    <space|2em><math|d<rsub|k>=a<rsub|k k>-<around*|\<\|\|\>|d<rsub|<around*|[|1:k-1|]>>\<circ\>L<rsub|<around*|[|k,1:k-1|]>>|\<\|\|\>><rsup|2><rsub|2>>

    <strong|end for>

    <strong|Output> <math|L,d>
  </named-algorithm>

  \;
</body>

<initial|<\collection>
</collection>>