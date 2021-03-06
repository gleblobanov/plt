module SkelCPP where

-- Haskell module generated by the BNF converter

import AbsCPP
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transId :: Id -> Result
transId x = case x of
  Id string -> failure x
transProgram :: Program -> Result
transProgram x = case x of
  PDefs defs -> failure x
transDef :: Def -> Result
transDef x = case x of
  DFun settype scopename args funrest -> failure x
  DFun1 settype scopename args funrest -> failure x
  DUs settype -> failure x
  DTypeDef settype id -> failure x
  DDecl settype scopenames -> failure x
  DInit settype scopename exp -> failure x
  DStruct scopename structdecls -> failure x
transFunRest :: FunRest -> Result
transFunRest x = case x of
  DFunRest stm -> failure x
  DFunRest2 -> failure x
transStructDecl :: StructDecl -> Result
transStructDecl x = case x of
  StructDecl settype id -> failure x
transArg :: Arg -> Result
transArg x = case x of
  Arg1 settype -> failure x
  Arg2 settype scopename -> failure x
  Arg3 settype scopename lit -> failure x
  Arg4 settype scopename id -> failure x
transSetType :: SetType -> Result
transSetType x = case x of
  SetType typename -> failure x
  SetTypeCT typename -> failure x
transTypeName :: TypeName -> Result
transTypeName x = case x of
  TypeName typeid -> failure x
  TypeName1 typeid -> failure x
transTypeId :: TypeId -> Result
transTypeId x = case x of
  TypeId type_ -> failure x
  TypeId1 scopename -> failure x
transScopeName :: ScopeName -> Result
transScopeName x = case x of
  ScopeName scopenameparts -> failure x
transScopeNamePart :: ScopeNamePart -> Result
transScopeNamePart x = case x of
  ScopeNamePart scopeparts templpart -> failure x
transScopePart :: ScopePart -> Result
transScopePart x = case x of
  ScopePart id -> failure x
transTemplPart :: TemplPart -> Result
transTemplPart x = case x of
  TemplPart templins -> failure x
  TemplPart2 -> failure x
transTemplIns :: TemplIns -> Result
transTemplIns x = case x of
  TemplIns type_ -> failure x
  TemplIns1 scopepartss -> failure x
transScopeParts :: ScopeParts -> Result
transScopeParts x = case x of
  ScopeParts scopenameparts -> failure x
transStm :: Stm -> Result
transStm x = case x of
  SExp exp -> failure x
  SBlock stms -> failure x
  SExpI exp -> failure x
  SDecl settype scopenames -> failure x
  SInit settype scopename exp -> failure x
  STypeDef scopename scopenames -> failure x
  SStruct scopename structdecls -> failure x
  SReturn exp -> failure x
  SStmIns stms -> failure x
  SWhile exp whilerest -> failure x
  SDo stm exp -> failure x
  SIf exp stm ifrest -> failure x
  SForF typename exp1 exp2 exp3 forrest -> failure x
transWhileRest :: WhileRest -> Result
transWhileRest x = case x of
  WhileR1 -> failure x
  WhileR2 stm -> failure x
transIfRest :: IfRest -> Result
transIfRest x = case x of
  IfRest stm -> failure x
  IfRest1 -> failure x
transForRest :: ForRest -> Result
transForRest x = case x of
  ForRest stm -> failure x
  ForRest1 -> failure x
transAppArg :: AppArg -> Result
transAppArg x = case x of
  AppArg exp -> failure x
transExp :: Exp -> Result
transExp x = case x of
  EStr lit -> failure x
  EId scopename -> failure x
  EApp scopename appargs -> failure x
  EInd scopename exp -> failure x
  EPIncr exp -> failure x
  EPDecr exp -> failure x
  EDot exp1 exp2 -> failure x
  EArrow exp1 exp2 -> failure x
  EIncr exp -> failure x
  EDecr exp -> failure x
  EExcl exp -> failure x
  EPnt exp -> failure x
  ETimes exp1 exp2 -> failure x
  EDiv exp1 exp2 -> failure x
  EPlus exp1 exp2 -> failure x
  EMinus exp1 exp2 -> failure x
  EBLsh exp1 exp2 -> failure x
  EBRsh exp1 exp2 -> failure x
  ELt exp1 exp2 -> failure x
  EGt exp1 exp2 -> failure x
  ELtEq exp1 exp2 -> failure x
  EGtWq exp1 exp2 -> failure x
  EEq exp1 exp2 -> failure x
  ENEq exp1 exp2 -> failure x
  EAnd exp1 exp2 -> failure x
  EOr exp1 exp2 -> failure x
  EAss exp1 exp2 -> failure x
  EAssPl exp1 exp2 -> failure x
  EAssMin exp1 exp2 -> failure x
  ECondAss exp1 exp2 exp3 -> failure x
  EThrow exp -> failure x
transType :: Type -> Result
transType x = case x of
  TypeBool -> failure x
  TypeInt -> failure x
  TypeDouble -> failure x
  TypeVoid -> failure x
transLit :: Lit -> Result
transLit x = case x of
  LitString strings -> failure x
  LitInteger integer -> failure x
  LitDouble double -> failure x
  LitChar char -> failure x
  LitTrue -> failure x
  LitFalse -> failure x

