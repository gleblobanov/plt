-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParCPP where
import AbsCPP
import LexCPP
import ErrM

}

%name pProgram Program
%name pListDef ListDef
%name pDef Def
%name pFunRest FunRest
%name pStructDecl StructDecl
%name pListStructDecl ListStructDecl
%name pArg Arg
%name pListArg ListArg
%name pSetType SetType
%name pTypeName TypeName
%name pTypeId TypeId
%name pListSetType ListSetType
%name pScopeName ScopeName
%name pListScopeName ListScopeName
%name pScopeNamePart ScopeNamePart
%name pListScopeNamePart ListScopeNamePart
%name pScopePart ScopePart
%name pListScopePart ListScopePart
%name pTemplPart TemplPart
%name pTemplIns TemplIns
%name pScopeParts ScopeParts
%name pListScopeParts ListScopeParts
%name pListStm ListStm
%name pStm Stm
%name pListStm1 ListStm1
%name pStm1 Stm1
%name pWhileRest WhileRest
%name pIfRest IfRest
%name pForRest ForRest
%name pExp16 Exp16
%name pExp15 Exp15
%name pAppArg AppArg
%name pListAppArg ListAppArg
%name pExp14 Exp14
%name pExp13 Exp13
%name pExp12 Exp12
%name pExp11 Exp11
%name pExp10 Exp10
%name pExp9 Exp9
%name pExp8 Exp8
%name pExp4 Exp4
%name pExp3 Exp3
%name pExp2 Exp2
%name pExp1 Exp1
%name pExp Exp
%name pExp5 Exp5
%name pExp6 Exp6
%name pExp7 Exp7
%name pListExp ListExp
%name pType Type
%name pLit Lit
%name pListString ListString
%name pListId ListId
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '!' { PT _ (TS _ 1) }
  '!=' { PT _ (TS _ 2) }
  '%' { PT _ (TS _ 3) }
  '&' { PT _ (TS _ 4) }
  '&&' { PT _ (TS _ 5) }
  '(' { PT _ (TS _ 6) }
  ')' { PT _ (TS _ 7) }
  '*' { PT _ (TS _ 8) }
  '+' { PT _ (TS _ 9) }
  '++' { PT _ (TS _ 10) }
  '+=' { PT _ (TS _ 11) }
  ',' { PT _ (TS _ 12) }
  '-' { PT _ (TS _ 13) }
  '--' { PT _ (TS _ 14) }
  '-=' { PT _ (TS _ 15) }
  '->' { PT _ (TS _ 16) }
  '.' { PT _ (TS _ 17) }
  '/' { PT _ (TS _ 18) }
  ':' { PT _ (TS _ 19) }
  '::' { PT _ (TS _ 20) }
  ';' { PT _ (TS _ 21) }
  '<' { PT _ (TS _ 22) }
  '<<' { PT _ (TS _ 23) }
  '<=' { PT _ (TS _ 24) }
  '=' { PT _ (TS _ 25) }
  '==' { PT _ (TS _ 26) }
  '>' { PT _ (TS _ 27) }
  '>=' { PT _ (TS _ 28) }
  '>>' { PT _ (TS _ 29) }
  '?' { PT _ (TS _ 30) }
  '[' { PT _ (TS _ 31) }
  ']' { PT _ (TS _ 32) }
  'bool' { PT _ (TS _ 33) }
  'const' { PT _ (TS _ 34) }
  'do' { PT _ (TS _ 35) }
  'double' { PT _ (TS _ 36) }
  'else' { PT _ (TS _ 37) }
  'false' { PT _ (TS _ 38) }
  'for' { PT _ (TS _ 39) }
  'if' { PT _ (TS _ 40) }
  'inline' { PT _ (TS _ 41) }
  'int' { PT _ (TS _ 42) }
  'return' { PT _ (TS _ 43) }
  'struct' { PT _ (TS _ 44) }
  'throw' { PT _ (TS _ 45) }
  'true' { PT _ (TS _ 46) }
  'typedef' { PT _ (TS _ 47) }
  'using' { PT _ (TS _ 48) }
  'void' { PT _ (TS _ 49) }
  'while' { PT _ (TS _ 50) }
  '{' { PT _ (TS _ 51) }
  '||' { PT _ (TS _ 52) }
  '}' { PT _ (TS _ 53) }

L_quoted { PT _ (TL $$) }
L_integ  { PT _ (TI $$) }
L_doubl  { PT _ (TD $$) }
L_charac { PT _ (TC $$) }
L_Id { PT _ (T_Id $$) }


%%

String  :: { String }  : L_quoted {  $1 }
Integer :: { Integer } : L_integ  { (read ( $1)) :: Integer }
Double  :: { Double }  : L_doubl  { (read ( $1)) :: Double }
Char    :: { Char }    : L_charac { (read ( $1)) :: Char }
Id    :: { Id} : L_Id { Id ($1)}

Program :: { Program }
Program : ListDef { AbsCPP.PDefs (reverse $1) }
ListDef :: { [Def] }
ListDef : {- empty -} { [] } | ListDef Def { flip (:) $1 $2 }
Def :: { Def }
Def : 'inline' SetType ScopeName '(' ListArg ')' FunRest { AbsCPP.DFun $2 $3 $5 $7 }
    | SetType ScopeName '(' ListArg ')' FunRest { AbsCPP.DFun1 $1 $2 $4 $6 }
    | 'using' SetType ';' { AbsCPP.DUs $2 }
    | 'typedef' SetType Id ';' { AbsCPP.DTypeDef $2 $3 }
    | SetType ListScopeName ';' { AbsCPP.DDecl $1 $2 }
    | SetType ScopeName '=' Exp ';' { AbsCPP.DInit $1 $2 $4 }
    | 'struct' ScopeName '{' ListStructDecl '}' ';' { AbsCPP.DStruct $2 (reverse $4) }
FunRest :: { FunRest }
FunRest : Stm { AbsCPP.DFunRest $1 } | ';' { AbsCPP.DFunRest2 }
StructDecl :: { StructDecl }
StructDecl : SetType Id { AbsCPP.StructDecl $1 $2 }
ListStructDecl :: { [StructDecl] }
ListStructDecl : {- empty -} { [] }
               | ListStructDecl StructDecl ';' { flip (:) $1 $2 }
Arg :: { Arg }
Arg : SetType { AbsCPP.Arg1 $1 }
    | SetType ScopeName { AbsCPP.Arg2 $1 $2 }
    | SetType ScopeName '=' Lit { AbsCPP.Arg3 $1 $2 $4 }
    | SetType ScopeName '=' Id { AbsCPP.Arg4 $1 $2 $4 }
ListArg :: { [Arg] }
ListArg : {- empty -} { [] }
        | Arg { (:[]) $1 }
        | Arg ',' ListArg { (:) $1 $3 }
SetType :: { SetType }
SetType : TypeName { AbsCPP.SetType $1 }
        | 'const' TypeName { AbsCPP.SetTypeCT $2 }
TypeName :: { TypeName }
TypeName : TypeId { AbsCPP.TypeName $1 }
         | TypeId '&' { AbsCPP.TypeName1 $1 }
TypeId :: { TypeId }
TypeId : Type { AbsCPP.TypeId $1 }
       | ScopeName { AbsCPP.TypeId1 $1 }
ListSetType :: { [SetType] }
ListSetType : SetType { (:[]) $1 }
            | SetType ',' ListSetType { (:) $1 $3 }
ScopeName :: { ScopeName }
ScopeName : ListScopeNamePart { AbsCPP.ScopeName $1 }
ListScopeName :: { [ScopeName] }
ListScopeName : ScopeName { (:[]) $1 }
              | ScopeName ',' ListScopeName { (:) $1 $3 }
ScopeNamePart :: { ScopeNamePart }
ScopeNamePart : ListScopePart TemplPart { AbsCPP.ScopeNamePart $1 $2 }
ListScopeNamePart :: { [ScopeNamePart] }
ListScopeNamePart : ScopeNamePart { (:[]) $1 }
                  | ScopeNamePart '::' ListScopeNamePart { (:) $1 $3 }
ScopePart :: { ScopePart }
ScopePart : Id { AbsCPP.ScopePart $1 }
ListScopePart :: { [ScopePart] }
ListScopePart : ScopePart { (:[]) $1 }
              | ScopePart '::' ListScopePart { (:) $1 $3 }
TemplPart :: { TemplPart }
TemplPart : '<' TemplIns '>' { AbsCPP.TemplPart $2 }
          | {- empty -} { AbsCPP.TemplPart2 }
TemplIns :: { TemplIns }
TemplIns : Type { AbsCPP.TemplIns $1 }
         | ListScopeParts { AbsCPP.TemplIns1 $1 }
ScopeParts :: { ScopeParts }
ScopeParts : ListScopeNamePart { AbsCPP.ScopeParts $1 }
ListScopeParts :: { [ScopeParts] }
ListScopeParts : ScopeParts { (:[]) $1 }
               | ScopeParts ',' ListScopeParts { (:) $1 $3 }
ListStm :: { [Stm] }
ListStm : {- empty -} { [] } | ListStm Stm { flip (:) $1 $2 }
Stm :: { Stm }
Stm : Exp ';' { AbsCPP.SExp $1 }
    | '{' ListStm1 '}' { AbsCPP.SBlock (reverse $2) }
ListStm1 :: { [Stm] }
ListStm1 : {- empty -} { [] } | ListStm1 Stm1 { flip (:) $1 $2 }
Stm1 :: { Stm }
Stm1 : Exp ';' { AbsCPP.SExpI $1 }
     | SetType ListScopeName ';' { AbsCPP.SDecl $1 $2 }
     | SetType ScopeName '=' Exp ';' { AbsCPP.SInit $1 $2 $4 }
     | 'typedef' ScopeName ListScopeName ';' { AbsCPP.STypeDef $2 $3 }
     | 'struct' ScopeName '{' ListStructDecl '}' ';' { AbsCPP.SStruct $2 (reverse $4) }
     | 'return' Exp ';' { AbsCPP.SReturn $2 }
     | '{' ListStm1 '}' { AbsCPP.SStmIns (reverse $2) }
     | 'while' '(' Exp ')' WhileRest { AbsCPP.SWhile $3 $5 }
     | 'do' Stm1 'while' '(' Exp ')' ';' { AbsCPP.SDo $2 $5 }
     | 'if' '(' Exp ')' Stm1 IfRest { AbsCPP.SIf $3 $5 $6 }
     | 'for' '(' TypeName Exp ';' Exp ';' Exp ')' ForRest { AbsCPP.SForF $3 $4 $6 $8 $10 }
WhileRest :: { WhileRest }
WhileRest : ';' { AbsCPP.WhileR1 } | Stm1 { AbsCPP.WhileR2 $1 }
IfRest :: { IfRest }
IfRest : 'else' Stm1 { AbsCPP.IfRest $2 }
       | {- empty -} { AbsCPP.IfRest1 }
ForRest :: { ForRest }
ForRest : Stm { AbsCPP.ForRest $1 } | ';' { AbsCPP.ForRest1 }
Exp16 :: { Exp }
Exp16 : Lit { AbsCPP.EStr $1 }
      | ScopeName { AbsCPP.EId $1 }
      | '(' Exp ')' { $2 }
Exp15 :: { Exp }
Exp15 : ScopeName '(' ListAppArg ')' { AbsCPP.EApp $1 $3 }
      | ScopeName '[' Exp ']' { AbsCPP.EInd $1 $3 }
      | Exp16 { $1 }
AppArg :: { AppArg }
AppArg : Exp { AbsCPP.AppArg $1 }
ListAppArg :: { [AppArg] }
ListAppArg : {- empty -} { [] }
           | AppArg { (:[]) $1 }
           | AppArg ',' ListAppArg { (:) $1 $3 }
Exp14 :: { Exp }
Exp14 : Exp15 '++' { AbsCPP.EPIncr $1 }
      | Exp15 '--' { AbsCPP.EPDecr $1 }
      | Exp14 '.' Exp15 { AbsCPP.EDot $1 $3 }
      | Exp14 '->' Exp15 { AbsCPP.EArrow $1 $3 }
      | Exp15 { $1 }
Exp13 :: { Exp }
Exp13 : '++' Exp14 { AbsCPP.EIncr $2 }
      | '--' Exp14 { AbsCPP.EDecr $2 }
      | '!' Exp14 { AbsCPP.EExcl $2 }
      | '*' Exp14 { AbsCPP.EPnt $2 }
      | Exp14 { $1 }
Exp12 :: { Exp }
Exp12 : Exp12 '*' Exp13 { AbsCPP.ETimes $1 $3 }
      | Exp12 '/' Exp13 { AbsCPP.EDiv $1 $3 }
      | Exp12 '%' Exp13 { AbsCPP.EDiv $1 $3 }
      | Exp13 { $1 }
Exp11 :: { Exp }
Exp11 : Exp11 '+' Exp12 { AbsCPP.EPlus $1 $3 }
      | Exp11 '-' Exp12 { AbsCPP.EMinus $1 $3 }
      | Exp12 { $1 }
Exp10 :: { Exp }
Exp10 : Exp10 '<<' Exp11 { AbsCPP.EBLsh $1 $3 }
      | Exp10 '>>' Exp11 { AbsCPP.EBRsh $1 $3 }
      | Exp11 { $1 }
Exp9 :: { Exp }
Exp9 : Exp9 '<' Exp10 { AbsCPP.ELt $1 $3 }
     | Exp9 '>' Exp10 { AbsCPP.EGt $1 $3 }
     | Exp9 '<=' Exp10 { AbsCPP.ELtEq $1 $3 }
     | Exp9 '>=' Exp10 { AbsCPP.EGtWq $1 $3 }
     | Exp10 { $1 }
Exp8 :: { Exp }
Exp8 : Exp8 '==' Exp9 { AbsCPP.EEq $1 $3 }
     | Exp8 '!=' Exp9 { AbsCPP.ENEq $1 $3 }
     | Exp9 { $1 }
Exp4 :: { Exp }
Exp4 : Exp4 '&&' Exp5 { AbsCPP.EAnd $1 $3 } | Exp5 { $1 }
Exp3 :: { Exp }
Exp3 : Exp3 '||' Exp4 { AbsCPP.EOr $1 $3 } | Exp4 { $1 }
Exp2 :: { Exp }
Exp2 : Exp3 '=' Exp2 { AbsCPP.EAss $1 $3 }
     | Exp3 '-=' Exp2 { AbsCPP.EAssPl $1 $3 }
     | Exp3 '+=' Exp2 { AbsCPP.EAssMin $1 $3 }
     | Exp3 '?' Exp2 ':' Exp1 { AbsCPP.ECondAss $1 $3 $5 }
     | Exp3 { $1 }
Exp1 :: { Exp }
Exp1 : 'throw' Exp2 { AbsCPP.EThrow $2 } | Exp2 { $1 }
Exp :: { Exp }
Exp : Exp1 { $1 }
Exp5 :: { Exp }
Exp5 : Exp6 { $1 }
Exp6 :: { Exp }
Exp6 : Exp7 { $1 }
Exp7 :: { Exp }
Exp7 : Exp8 { $1 }
ListExp :: { [Exp] }
ListExp : {- empty -} { [] }
        | Exp { (:[]) $1 }
        | Exp ',' ListExp { (:) $1 $3 }
Type :: { Type }
Type : 'bool' { AbsCPP.TypeBool }
     | 'int' { AbsCPP.TypeInt }
     | 'double' { AbsCPP.TypeDouble }
     | 'void' { AbsCPP.TypeVoid }
Lit :: { Lit }
Lit : ListString { AbsCPP.LitString $1 }
    | Integer { AbsCPP.LitInteger $1 }
    | Double { AbsCPP.LitDouble $1 }
    | Char { AbsCPP.LitChar $1 }
    | 'true' { AbsCPP.LitTrue }
    | 'false' { AbsCPP.LitFalse }
ListString :: { [String] }
ListString : String { (:[]) $1 } | String ListString { (:) $1 $2 }
ListId :: { [Id] }
ListId : Id { (:[]) $1 } | Id ',' ListId { (:) $1 $3 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
}

