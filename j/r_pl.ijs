NB. From http://jsoftware.com/svn/DanBron/trunk/general/r_pl.ijs
IFCONSOLE_z_ =.  IFCONSOLE_z_"_ :: (0 -: (11!:0) :: 0:) ''
   IFUNIX_z_    =.  5 -: 9!:12''
   9!:7^:IFCONSOLE '+++++++++|-'

   init         =.  0 ; _ ; ]

   failsafe     =.  :: err =. [: (13!:11 ,&:< 13!:12) ''"_
   
   Read         =.  1!:1@:1:


   StdOrErr     =.     2: + IFUNIX * 5 - e.&0 _                 NB.  Windows: always use 2.  Unix: 4 if standard, 5 if error.
   Print        =.  [  (1!:2 StdOrErr)~&>/
   Loop         =.  (^:(_ -: >@:{.)) (^:_)                      NB.  Could replace _ with a: to accumulate all input lines
   
   ReadPrint    =.  Read :. Print                               
   
   R_PL         =:  failsafe (&.: ReadPrint) Loop failsafe (@:init)
   R_PL         =:  'R_PL' f.
   NB.   R_PL   =:  ( :: err) (&.: (1!:1@:1: :. ([(1!:2 (IFCONSOLE =: 0 -: (11!:0) :: 0: '') { 2,  5: - e.&0 _)~&>/))) (^:(_ -: >@:{.)) (^:_) ( :: err =. [: (13!:11 ,&:< 13!:12) ''"_) (@: (_&;) ) 
   
NB.r_pl         =:  1 : '3 : (''9!:29[1[9!:27            ''''('', (5!:5{.;:''u'') , '')R_PL '''',5!:5{.;:''''y'''''')'
   r_pl         =:  1 : '3 : (''9!:29[1[9!:27            ''''('', (U =. 5!:5{.;:''u'') , '')R_PL :: '',U,''R_PL '''',5!:5{.;:''''y'''''')'
NB.r_plx        =:  1 : '3 : (''9!:29[1[9!:27 ''''2!:55 > {. ('', (5!:5{.;:''u'') , '')R_PL '''',5!:5{.;:''''y'''''')'
   r_plx        =:  1 : '3 : (''9!:29[1[9!:27 ''''2!:55 > {. ('', (U =. 5!:5{.;:''u'') , '')R_PL :: '',U,''R_PL '''',5!:5{.;:''''y'''''')'
   NB.  r_plx is like r_pl but exits J at the end.




NB.  The   R_PL :: R_PL  should fix the CTRL+C and jbreak problem.
NB.  want to tack a boolean on to the code;text structure.   Then,
NB.  at every iteration, negate the boolean, so that  ^:_  never sees
NB.  the same input twice.
NB.  Want to call U either monadically or dyadically.  The argument  y
NB.  will always be what is is now:  just 1!:1@:1 .  So the monadic
NB.  case doesn't change.  Dyadically, the argument  x  shoudl be the
NB.  result of the last execution.   Maybe we can change the defs so that
NB.  The structure is  boolean;return-code;print-text;other-info
NB.  where other-info will be whatever the verb wants. including the entire
NB.  history of input (and output!) if it desires.  The verb should never see
NB.  or have any control over the boolean.

 ((-.&.>@:{. , }.)@:) (^:(_ -: 1&{::)) (^:_)     NB.  Flips the bit

NB.  Want to provide a default dyad that calls the monad but 
NB.  records the i/o (in a mapped file?) and the last result
NB.  of the derived verb will be the entire "conversation".
